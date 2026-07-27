defmodule Storybook.Primitives.ScrollAreaStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.ScrollArea

  def function, do: &ScrollArea.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "scroll-area"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Essence UI scroll area demo",
        template: """
        <ScrollArea.root
          id="scroll-area-primitive"
          class="DemoScrollAreaRoot"
          type="always"
        >
          <ScrollArea.viewport class="DemoScrollAreaViewport">
            <div style="padding: 15px 20px;">
              <div class="DemoText">Tags</div>
                <div class="DemoTag">v1.2.0-beta.50</div>
                <div class="DemoTag">v1.2.0-beta.49</div>
                <div class="DemoTag">v1.2.0-beta.48</div>
                <div class="DemoTag">v1.2.0-beta.47</div>
                <div class="DemoTag">v1.2.0-beta.46</div>
                <div class="DemoTag">v1.2.0-beta.45</div>
                <div class="DemoTag">v1.2.0-beta.44</div>
                <div class="DemoTag">v1.2.0-beta.43</div>
                <div class="DemoTag">v1.2.0-beta.42</div>
                <div class="DemoTag">v1.2.0-beta.41</div>
                <div class="DemoTag">v1.2.0-beta.40</div>
                <div class="DemoTag">v1.2.0-beta.39</div>
                <div class="DemoTag">v1.2.0-beta.38</div>
                <div class="DemoTag">v1.2.0-beta.37</div>
                <div class="DemoTag">v1.2.0-beta.36</div>
                <div class="DemoTag">v1.2.0-beta.35</div>
                <div class="DemoTag">v1.2.0-beta.34</div>
                <div class="DemoTag">v1.2.0-beta.33</div>
                <div class="DemoTag">v1.2.0-beta.32</div>
                <div class="DemoTag">v1.2.0-beta.31</div>
                <div class="DemoTag">v1.2.0-beta.30</div>
                <div class="DemoTag">v1.2.0-beta.29</div>
                <div class="DemoTag">v1.2.0-beta.28</div>
                <div class="DemoTag">v1.2.0-beta.27</div>
                <div class="DemoTag">v1.2.0-beta.26</div>
                <div class="DemoTag">v1.2.0-beta.25</div>
                <div class="DemoTag">v1.2.0-beta.24</div>
                <div class="DemoTag">v1.2.0-beta.23</div>
                <div class="DemoTag">v1.2.0-beta.22</div>
                <div class="DemoTag">v1.2.0-beta.21</div>
                <div class="DemoTag">v1.2.0-beta.20</div>
                <div class="DemoTag">v1.2.0-beta.19</div>
                <div class="DemoTag">v1.2.0-beta.18</div>
                <div class="DemoTag">v1.2.0-beta.17</div>
                <div class="DemoTag">v1.2.0-beta.16</div>
                <div class="DemoTag">v1.2.0-beta.15</div>
                <div class="DemoTag">v1.2.0-beta.14</div>
                <div class="DemoTag">v1.2.0-beta.13</div>
                <div class="DemoTag">v1.2.0-beta.12</div>
                <div class="DemoTag">v1.2.0-beta.11</div>
                <div class="DemoTag">v1.2.0-beta.10</div>
                <div class="DemoTag">v1.2.0-beta.9</div>
                <div class="DemoTag">v1.2.0-beta.8</div>
                <div class="DemoTag">v1.2.0-beta.7</div>
                <div class="DemoTag">v1.2.0-beta.6</div>
                <div class="DemoTag">v1.2.0-beta.5</div>
                <div class="DemoTag">v1.2.0-beta.4</div>
                <div class="DemoTag">v1.2.0-beta.3</div>
                <div class="DemoTag">v1.2.0-beta.2</div>
                <div class="DemoTag">v1.2.0-beta.1</div>
            </div>
          </ScrollArea.viewport>
          <ScrollArea.scrollbar
            class="DemoScrollAreaScrollbar"
            orientation="vertical"
          >
            <ScrollArea.thumb class="DemoScrollAreaThumb" />
          </ScrollArea.scrollbar>
          <ScrollArea.scrollbar
            class="DemoScrollAreaScrollbar"
            orientation="horizontal"
          >
            <ScrollArea.thumb class="DemoScrollAreaThumb" />
          </ScrollArea.scrollbar>
          <ScrollArea.corner class="DemoScrollAreaCorner" />
        </ScrollArea.root>
        """
      }
    ]
  end
end
