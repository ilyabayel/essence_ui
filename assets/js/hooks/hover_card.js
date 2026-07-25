import { hasFinePointerHover, whenMouse } from "../lib/pointer";

export const HoverCard = {
  mounted() {
    this.openDelay = parseInt(this.el.dataset.openDelay) || 200;
    this.closeDelay = parseInt(this.el.dataset.closeDelay) || 150;

    this.openTimeout = null;
    this.closeTimeout = null;
    this.isOpen = false;
    this._touchOpen = !hasFinePointerHover();

    this.trigger = this.el.querySelector('[data-hover-card-trigger]');
    this.content = this.el.querySelector('[data-hover-card-content]');

    if (!this.trigger || !this.content) return;

    this.onTriggerEnter = whenMouse(this.onTriggerEnter.bind(this));
    this.onTriggerLeave = whenMouse(this.onTriggerLeave.bind(this));
    this.onContentEnter = whenMouse(this.onContentEnter.bind(this));
    this.onContentLeave = whenMouse(this.onContentLeave.bind(this));
    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onDocumentPointerDown = this.onDocumentPointerDown.bind(this);

    if (this._touchOpen) {
      this.trigger.addEventListener('click', this.onTriggerClick);
      document.addEventListener('pointerdown', this.onDocumentPointerDown, true);
    } else {
      this.trigger.addEventListener('pointerenter', this.onTriggerEnter);
      this.trigger.addEventListener('pointerleave', this.onTriggerLeave);
      this.content.addEventListener('pointerenter', this.onContentEnter);
      this.content.addEventListener('pointerleave', this.onContentLeave);
    }
  },

  onTriggerEnter() {
    this.show();
  },

  onTriggerLeave() {
    this.hide();
  },

  onContentEnter() {
    // Cancel close when hovering over the content
    if (this.closeTimeout) {
      clearTimeout(this.closeTimeout);
      this.closeTimeout = null;
    }
  },

  onContentLeave() {
    this.hide();
  },

  onTriggerClick(e) {
    e.preventDefault();
    e.stopPropagation();
    if (this.isOpen) {
      this.closeNow();
    } else {
      this.show(true);
    }
  },

  onDocumentPointerDown(e) {
    if (!this.isOpen) return;
    if (this.trigger?.contains(e.target) || this.content?.contains(e.target)) {
      return;
    }
    this.closeNow();
  },

  show(immediate = false) {
    if (this.closeTimeout) {
      clearTimeout(this.closeTimeout);
      this.closeTimeout = null;
    }

    if (this.isOpen) return;

    const open = () => {
      this.content.style.display = 'block';
      this.positionContent();
      this.content.dataset.state = 'open';
      this.trigger.dataset.state = 'open';
      this.isOpen = true;
      this.openTimeout = null;
    };

    if (immediate) {
      if (this.openTimeout) {
        clearTimeout(this.openTimeout);
        this.openTimeout = null;
      }
      open();
      return;
    }

    if (this.openTimeout) return;
    this.openTimeout = setTimeout(open, this.openDelay);
  },

  hide() {
    if (this.openTimeout) {
      clearTimeout(this.openTimeout);
      this.openTimeout = null;
    }

    if (!this.closeTimeout && this.isOpen) {
      this.closeTimeout = setTimeout(() => {
        this.closeNow();
      }, this.closeDelay);
    }
  },

  closeNow() {
    if (this.openTimeout) clearTimeout(this.openTimeout);
    if (this.closeTimeout) clearTimeout(this.closeTimeout);
    this.openTimeout = null;
    this.closeTimeout = null;
    if (!this.isOpen) return;
    this.content.dataset.state = 'closed';
    this.content.style.display = 'none';
    this.trigger.dataset.state = 'closed';
    this.isOpen = false;
  },

  positionContent() {
    const triggerEl = this.trigger.firstElementChild || this.trigger;
    const triggerRect = triggerEl.getBoundingClientRect();
    const side = this.content.dataset.side || 'bottom';
    const align = this.content.dataset.align || 'start';
    const sideOffset = 8;
    const collisionPadding = 10;

    // Temporarily make visible for measurement
    this.content.style.position = 'fixed';
    this.content.style.visibility = 'hidden';
    this.content.style.display = 'block';

    const contentWidth = this.content.offsetWidth;
    const contentHeight = this.content.offsetHeight;

    this.content.style.visibility = '';

    let top, left;

    if (side === 'bottom') {
      top = triggerRect.bottom + sideOffset;
    } else if (side === 'top') {
      top = triggerRect.top - contentHeight - sideOffset;
    } else if (side === 'right') {
      left = triggerRect.right + sideOffset;
      top = triggerRect.top;
    } else {
      left = triggerRect.left - contentWidth - sideOffset;
      top = triggerRect.top;
    }

    if (side === 'top' || side === 'bottom') {
      if (align === 'start') {
        left = triggerRect.left;
      } else if (align === 'end') {
        left = triggerRect.right - contentWidth;
      } else {
        left = triggerRect.left + (triggerRect.width - contentWidth) / 2;
      }
    }

    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;

    if (left < collisionPadding) left = collisionPadding;
    if (left + contentWidth > viewportWidth - collisionPadding) {
      left = viewportWidth - contentWidth - collisionPadding;
    }

    if (top + contentHeight > viewportHeight - collisionPadding) {
      // Flip to top if needed
      if (side === 'bottom') {
        top = triggerRect.top - contentHeight - sideOffset;
      } else {
        top = viewportHeight - contentHeight - collisionPadding;
      }
    }

    this.content.style.position = 'fixed';
    this.content.style.top = top + 'px';
    this.content.style.left = left + 'px';
    this.content.style.zIndex = '9999';
  },

  destroyed() {
    if (this.openTimeout) clearTimeout(this.openTimeout);
    if (this.closeTimeout) clearTimeout(this.closeTimeout);

    if (this.trigger) {
      this.trigger.removeEventListener('pointerenter', this.onTriggerEnter);
      this.trigger.removeEventListener('pointerleave', this.onTriggerLeave);
      this.trigger.removeEventListener('click', this.onTriggerClick);
    }
    if (this.content) {
      this.content.removeEventListener('pointerenter', this.onContentEnter);
      this.content.removeEventListener('pointerleave', this.onContentLeave);
    }
    document.removeEventListener('pointerdown', this.onDocumentPointerDown, true);
  }
};
