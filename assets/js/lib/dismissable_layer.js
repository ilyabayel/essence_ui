/**
 * Binds Escape and outside-pointer dismiss handlers.
 *
 * @param {object} options
 * @param {() => void} options.onDismiss - Called when dismiss is triggered
 * @param {Element|Element[]} [options.layers] - Elements treated as "inside" (clicks outside dismiss)
 * @param {boolean} [options.escape=true] - Dismiss on Escape
 * @param {boolean} [options.outside=true] - Dismiss on outside pointer
 * @returns {{ unbind: () => void }}
 */
export function bindDismissableLayer({
  onDismiss,
  layers = [],
  escape = true,
  outside = true,
} = {}) {
  const layerList = Array.isArray(layers) ? layers : [layers];
  const handlers = {};

  if (escape) {
    handlers.onKeyDown = (e) => {
      if (e.key === "Escape") {
        onDismiss?.(e);
      }
    };
    document.addEventListener("keydown", handlers.onKeyDown);
  }

  if (outside) {
    handlers.onPointerDown = (e) => {
      const target = e.target;
      const inside = layerList.some((el) => el && el.contains(target));
      if (!inside) {
        onDismiss?.(e);
      }
    };
    document.addEventListener("pointerdown", handlers.onPointerDown, true);
  }

  return {
    handlers,
    unbind() {
      unbindDismissableLayer(handlers);
    },
  };
}

/**
 * Removes dismiss handlers previously returned/stored from bindDismissableLayer.
 *
 * @param {{ onKeyDown?: Function, onPointerDown?: Function }} handlers
 */
export function unbindDismissableLayer(handlers = {}) {
  if (handlers.onKeyDown) {
    document.removeEventListener("keydown", handlers.onKeyDown);
  }
  if (handlers.onPointerDown) {
    document.removeEventListener("pointerdown", handlers.onPointerDown, true);
  }
}
