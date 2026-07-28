# Find eligible builder and runner images on Docker Hub. We use Ubuntu/Debian
# instead of Alpine to avoid DNS resolution issues in production.
#
# https://hub.docker.com/r/hexpm/elixir/tags?name=ubuntu
# https://hub.docker.com/_/ubuntu/tags
#
# Build from the repository root so the website path dep (`{:essence_ui, path: ".."}`)
# resolves correctly.
#
ARG ELIXIR_VERSION=1.16.3
ARG OTP_VERSION=26.2.5.2
ARG DEBIAN_VERSION=bookworm-20240904-slim

ARG BUILDER_IMAGE="docker.io/hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="docker.io/debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} AS builder

# install build dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential git nodejs npm \
  && rm -rf /var/lib/apt/lists/*

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force \
  && mix local.rebar --force

# set build ENV
ENV MIX_ENV="prod"

# --- Library (path dep parent) ---
COPY mix.exs mix.lock ./
COPY lib lib
COPY priv priv
COPY assets/package.json assets/package-lock.json assets/
COPY assets/essence.css assets/postcss.config.js assets/postcss-breakpoints.js assets/postcss-whitespace.js assets/
COPY assets/css assets/css
COPY assets/radix assets/radix
COPY assets/js assets/js
COPY scripts scripts

RUN mix deps.get --only $MIX_ENV \
  && mix deps.compile

# Build consumer stylesheet into priv/static/essence-ui.css
RUN cd assets \
  && npm ci --no-audit --no-fund \
  && npm run build:css:release

# --- Website ---
WORKDIR /app/website

COPY website/mix.exs website/mix.lock ./
COPY website/config/config.exs website/config/${MIX_ENV}.exs config/
COPY website/assets/package.json website/assets/package-lock.json assets/

RUN mix deps.get --only $MIX_ENV \
  && mix deps.compile \
  && mix assets.setup

COPY website/priv priv
COPY website/lib lib
COPY website/docs docs
COPY website/assets assets
COPY website/rel rel

# Compile website CSS (imports deps/essence_ui stylesheet) and JS
RUN cd assets \
  && npm ci --no-audit --no-fund \
  && npm run build:css

RUN mix assets.deploy
RUN mix compile

COPY website/config/runtime.exs config/
RUN mix release

# start a new build stage so that the final image will only contain
# the compiled release and other runtime necessities
FROM ${RUNNER_IMAGE} AS final

RUN apt-get update \
  && apt-get install -y --no-install-recommends libstdc++6 openssl libncurses5 locales ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
  && locale-gen

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

WORKDIR "/app"
RUN chown nobody /app

# set runner ENV
ENV MIX_ENV="prod"

# Only copy the final release from the build stage
COPY --from=builder --chown=nobody:root /app/website/_build/${MIX_ENV}/rel/essence_ui_web ./

USER nobody

CMD ["/app/bin/server"]
