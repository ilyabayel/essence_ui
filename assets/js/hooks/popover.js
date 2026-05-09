export const Popover = {
  mounted() {
    this.isOpen = false;
    this.trigger = this.el.querySelector('[data-popover-trigger]');
    this.content = this.el.querySelector('[data-popover-content]');

    if (!this.trigger || !this.content) return;

    this.onTriggerClick = this.onTriggerClick.bind(this);
    this.onDocumentClick = this.onDocumentClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.onCloseClick = this.onCloseClick.bind(this);
    this.handleFocusTrap = this.handleFocusTrap.bind(this);

    this.trigger.addEventListener('click', this.onTriggerClick);

    // Bind close buttons inside content
    this.bindCloseButtons();
  },

  bindCloseButtons() {
    const closeButtons = this.content.querySelectorAll('[data-popover-close]');
    closeButtons.forEach(btn => {
      btn.addEventListener('click', this.onCloseClick);
    });
  },

  onTriggerClick(e) {
    e.stopPropagation();
    if (this.isOpen) {
      this.close();
    } else {
      this.open();
    }
  },

  onCloseClick() {
    this.close();
  },

  onDocumentClick(e) {
    if (this.isOpen && !this.trigger.contains(e.target) && !this.content.contains(e.target)) {
      this.close();
    }
  },

  onKeyDown(e) {
    if (e.key === 'Escape') {
      this.close();
      this.returnFocus();
    } else if (e.key === 'Tab') {
      this.handleFocusTrap(e);
    }
  },

  handleFocusTrap(e) {
    const focusables = this.content.querySelectorAll(
      'button:not([disabled]), [href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])'
    );
    if (focusables.length === 0) return;

    const first = focusables[0];
    const last = focusables[focusables.length - 1];

    if (e.shiftKey) {
      if (document.activeElement === first) {
        last.focus();
        e.preventDefault();
      }
    } else {
      if (document.activeElement === last) {
        first.focus();
        e.preventDefault();
      }
    }
  },

  open() {
    this.content.style.display = 'block';
    this.content.dataset.state = 'open';
    this.trigger.dataset.state = 'open';
    this.isOpen = true;

    this.positionContent();

    // Use capturing phase for document click to ensure we catch it before other handlers
    document.addEventListener('click', this.onDocumentClick, true);
    document.addEventListener('keydown', this.onKeyDown);

    // Focus first focusable element
    requestAnimationFrame(() => {
      const firstFocusable = this.content.querySelector(
        'button:not([disabled]), [href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])'
      );
      if (firstFocusable) {
        firstFocusable.focus();
      } else {
        this.content.tabIndex = -1;
        this.content.focus();
      }
    });
  },

  close() {
    if (!this.isOpen) return;
    
    this.content.dataset.state = 'closed';
    this.trigger.dataset.state = 'closed';
    this.isOpen = false;

    // Wait for animation to finish before hiding
    const onAnimationEnd = () => {
      if (!this.isOpen) {
        this.content.style.display = 'none';
      }
      this.content.removeEventListener('animationend', onAnimationEnd);
    };
    this.content.addEventListener('animationend', onAnimationEnd);

    document.removeEventListener('click', this.onDocumentClick, true);
    document.removeEventListener('keydown', this.onKeyDown);
    
    this.returnFocus();
  },

  returnFocus() {
    const focusable = this.trigger.querySelector('button, a, [tabindex]:not([tabindex="-1"])') || this.trigger;
    focusable.focus();
  },

  positionContent() {
    const triggerEl = this.trigger.firstElementChild || this.trigger;
    const triggerRect = triggerEl.getBoundingClientRect();
    const side = this.content.dataset.side || 'bottom';
    const align = this.content.dataset.align || 'start';
    const sideOffset = 8;
    const collisionPadding = 10;

    const contentWidth = this.content.offsetWidth;
    const contentHeight = this.content.offsetHeight;

    let top, left;

    // Calculate position based on side
    if (side === 'top' || side === 'bottom') {
      top = side === 'top' 
        ? triggerRect.top - contentHeight - sideOffset 
        : triggerRect.bottom + sideOffset;

      if (align === 'start') {
        left = triggerRect.left;
      } else if (align === 'end') {
        left = triggerRect.right - contentWidth;
      } else {
        left = triggerRect.left + (triggerRect.width / 2) - (contentWidth / 2);
      }
    } else {
      left = side === 'left' 
        ? triggerRect.left - contentWidth - sideOffset 
        : triggerRect.right + sideOffset;

      if (align === 'start') {
        top = triggerRect.top;
      } else if (align === 'end') {
        top = triggerRect.bottom - contentHeight;
      } else {
        top = triggerRect.top + (triggerRect.height / 2) - (contentHeight / 2);
      }
    }

    // Collision detection
    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;

    if (left < collisionPadding) left = collisionPadding;
    if (left + contentWidth > viewportWidth - collisionPadding) left = viewportWidth - contentWidth - collisionPadding;
    if (top < collisionPadding) top = collisionPadding;
    if (top + contentHeight > viewportHeight - collisionPadding) top = viewportHeight - contentHeight - collisionPadding;

    this.content.style.position = 'fixed';
    this.content.style.top = `${top}px`;
    this.content.style.left = `${left}px`;
  },

  destroyed() {
    this.trigger.removeEventListener('click', this.onTriggerClick);
    document.removeEventListener('click', this.onDocumentClick, true);
    document.removeEventListener('keydown', this.onKeyDown);
  }
};
