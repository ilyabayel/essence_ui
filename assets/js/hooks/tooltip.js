export const Tooltip = {
  mounted() {
    this.openDelay = parseInt(this.el.dataset.openDelay) || 700;
    this.closeDelay = parseInt(this.el.dataset.closeDelay) || 300;
    this.tooltipId = this.el.dataset.tooltipId;

    this.openTimeout = null;
    this.closeTimeout = null;
    
    this.onMouseEnter = this.onMouseEnter.bind(this);
    this.onMouseLeave = this.onMouseLeave.bind(this);
    this.onFocusIn = this.onFocusIn.bind(this);
    this.onFocusOut = this.onFocusOut.bind(this);

    this.el.addEventListener('mouseenter', this.onMouseEnter);
    this.el.addEventListener('mouseleave', this.onMouseLeave);
    this.el.addEventListener('focusin', this.onFocusIn);
    this.el.addEventListener('focusout', this.onFocusOut);
  },

  getTooltip() {
    return document.getElementById(this.tooltipId);
  },

  onMouseEnter() { this.show(); },
  onMouseLeave() { this.hide(); },
  onFocusIn() { this.show(); },
  onFocusOut() { this.hide(); },

  show() {
    if (this.closeTimeout) {
      clearTimeout(this.closeTimeout);
      this.closeTimeout = null;
    }

    if (!this.openTimeout) {
      this.openTimeout = setTimeout(() => {
        const tooltip = this.getTooltip();
        if (tooltip) {
          tooltip.style.display = 'block';
          tooltip.style.width = 'max-content';
          this.positionTooltip(tooltip);
          tooltip.dataset.state = 'delayed-open';
          this.el.dataset.state = 'open';
        }
        this.openTimeout = null;
      }, this.openDelay);
    }
  },

  hide() {
    if (this.openTimeout) {
      clearTimeout(this.openTimeout);
      this.openTimeout = null;
    }

    if (!this.closeTimeout) {
      this.closeTimeout = setTimeout(() => {
        const tooltip = this.getTooltip();
        if (tooltip) {
          tooltip.dataset.state = 'closed';
          tooltip.style.display = 'none';
          this.el.dataset.state = 'closed';
        }
        this.closeTimeout = null;
      }, this.closeDelay);
    }
  },

  positionTooltip(tooltip) {
    // Measure the actual button/target, not the full-width block wrapper
    const targetEl = this.el.firstElementChild || this.el;
    const triggerRect = targetEl.getBoundingClientRect();
    const side = tooltip.dataset.side || 'top';
    const align = tooltip.dataset.align || 'center';

    let top, left;
    const offset = 8;

    if (side === 'top' || side === 'bottom') {
      if (side === 'top') top = triggerRect.top - tooltip.offsetHeight - offset;
      if (side === 'bottom') top = triggerRect.bottom + offset;
      
      if (align === 'start') {
        left = triggerRect.left;
      } else if (align === 'end') {
        left = triggerRect.right - tooltip.offsetWidth;
      } else {
        left = triggerRect.left + (triggerRect.width / 2) - (tooltip.offsetWidth / 2);
      }
    } else {
      if (side === 'left') left = triggerRect.left - tooltip.offsetWidth - offset;
      if (side === 'right') left = triggerRect.right + offset;
      
      if (align === 'start') {
        top = triggerRect.top;
      } else if (align === 'end') {
        top = triggerRect.bottom - tooltip.offsetHeight;
      } else {
        top = triggerRect.top + (triggerRect.height / 2) - (tooltip.offsetHeight / 2);
      }
    }

    tooltip.style.position = 'fixed';
    tooltip.style.top = top + 'px';
    tooltip.style.left = left + 'px';
    tooltip.style.zIndex = '9999';
    tooltip.style.pointerEvents = 'none';

    const arrow = tooltip.querySelector('.rt-TooltipArrow');
    if (arrow) {
      let aTop = '', aLeft = '', aRight = '', aBottom = '', transform = '';

      if (side === 'top') {
        aBottom = '-4px';
        transform = 'rotate(0deg)';
      } else if (side === 'bottom') {
        aTop = '-4px';
        transform = 'rotate(180deg)';
      } else if (side === 'left') {
        aRight = '-7.5px'; 
        transform = 'rotate(-90deg)';
      } else if (side === 'right') {
        aLeft = '-7.5px';
        transform = 'rotate(90deg)';
      }

      if (side === 'top' || side === 'bottom') {
        if (align === 'center') aLeft = 'calc(50% - 5px)';
        if (align === 'start') aLeft = '16px';
        if (align === 'end') aRight = '16px';
      } else {
        if (align === 'center') aTop = 'calc(50% - 2.5px)';
        if (align === 'start') aTop = '8px';
        if (align === 'end') aBottom = '8px';
      }

      arrow.style.top = aTop;
      arrow.style.left = aLeft;
      arrow.style.right = aRight;
      arrow.style.bottom = aBottom;
      arrow.style.transform = transform;
    }
  },

  destroyed() {
    if (this.openTimeout) clearTimeout(this.openTimeout);
    if (this.closeTimeout) clearTimeout(this.closeTimeout);
    this.el.removeEventListener('mouseenter', this.onMouseEnter);
    this.el.removeEventListener('mouseleave', this.onMouseLeave);
    this.el.removeEventListener('focusin', this.onFocusIn);
    this.el.removeEventListener('focusout', this.onFocusOut);
  }
};
