export const HoverCard = {
  mounted() {
    this.openDelay = parseInt(this.el.dataset.openDelay) || 200;
    this.closeDelay = parseInt(this.el.dataset.closeDelay) || 150;

    this.openTimeout = null;
    this.closeTimeout = null;
    this.isOpen = false;

    this.trigger = this.el.querySelector('[data-hover-card-trigger]');
    this.content = this.el.querySelector('[data-hover-card-content]');

    if (!this.trigger || !this.content) return;

    this.onTriggerEnter = this.onTriggerEnter.bind(this);
    this.onTriggerLeave = this.onTriggerLeave.bind(this);
    this.onContentEnter = this.onContentEnter.bind(this);
    this.onContentLeave = this.onContentLeave.bind(this);

    this.trigger.addEventListener('mouseenter', this.onTriggerEnter);
    this.trigger.addEventListener('mouseleave', this.onTriggerLeave);
    this.content.addEventListener('mouseenter', this.onContentEnter);
    this.content.addEventListener('mouseleave', this.onContentLeave);
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

  show() {
    if (this.closeTimeout) {
      clearTimeout(this.closeTimeout);
      this.closeTimeout = null;
    }

    if (!this.openTimeout && !this.isOpen) {
      this.openTimeout = setTimeout(() => {
        this.content.style.display = 'block';
        this.positionContent();
        this.content.dataset.state = 'open';
        this.trigger.dataset.state = 'open';
        this.isOpen = true;
        this.openTimeout = null;
      }, this.openDelay);
    }
  },

  hide() {
    if (this.openTimeout) {
      clearTimeout(this.openTimeout);
      this.openTimeout = null;
    }

    if (!this.closeTimeout && this.isOpen) {
      this.closeTimeout = setTimeout(() => {
        this.content.dataset.state = 'closed';
        this.content.style.display = 'none';
        this.trigger.dataset.state = 'closed';
        this.isOpen = false;
        this.closeTimeout = null;
      }, this.closeDelay);
    }
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

    // Calculate position based on side
    if (side === 'top' || side === 'bottom') {
      if (side === 'top') {
        top = triggerRect.top - contentHeight - sideOffset;
      } else {
        top = triggerRect.bottom + sideOffset;
      }

      if (align === 'start') {
        left = triggerRect.left;
      } else if (align === 'end') {
        left = triggerRect.right - contentWidth;
      } else {
        left = triggerRect.left + (triggerRect.width / 2) - (contentWidth / 2);
      }
    } else {
      if (side === 'left') {
        left = triggerRect.left - contentWidth - sideOffset;
      } else {
        left = triggerRect.right + sideOffset;
      }

      if (align === 'start') {
        top = triggerRect.top;
      } else if (align === 'end') {
        top = triggerRect.bottom - contentHeight;
      } else {
        top = triggerRect.top + (triggerRect.height / 2) - (contentHeight / 2);
      }
    }

    // Collision detection — keep within viewport
    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;

    if (left < collisionPadding) {
      left = collisionPadding;
    } else if (left + contentWidth > viewportWidth - collisionPadding) {
      left = viewportWidth - contentWidth - collisionPadding;
    }

    if (top < collisionPadding) {
      // Flip to bottom if needed
      if (side === 'top') {
        top = triggerRect.bottom + sideOffset;
      } else {
        top = collisionPadding;
      }
    } else if (top + contentHeight > viewportHeight - collisionPadding) {
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
      this.trigger.removeEventListener('mouseenter', this.onTriggerEnter);
      this.trigger.removeEventListener('mouseleave', this.onTriggerLeave);
    }
    if (this.content) {
      this.content.removeEventListener('mouseenter', this.onContentEnter);
      this.content.removeEventListener('mouseleave', this.onContentLeave);
    }
  }
};
