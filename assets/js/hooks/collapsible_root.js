export const CollapsibleRoot = {
  mounted() {
    this.trigger = this.el.querySelector('[data-essence-collapsible-trigger]');
    this.content = this.el.querySelector('[data-essence-collapsible-content]');
    this.disabled = this.el.hasAttribute('data-disabled');
    this.isMountAnimationPrevented = true;

    if (this.trigger && this.content) {
      this.trigger.addEventListener('click', () => {
        if (this.disabled) return;
        const isOpen = this.el.dataset.state === 'open';
        if (isOpen) {
          this.close();
        } else {
          this.open();
        }
      });
    }

    // Handle presence/exit animations
    this._onAnimationEnd = (e) => {
      if (e.target === this.content && this.el.dataset.state === 'closed') {
        this.content.hidden = true;
      }
    };
    this.content?.addEventListener('animationend', this._onAnimationEnd);
    this.content?.addEventListener('transitionend', this._onAnimationEnd);

    // Support external orchestration (e.g. from Accordion)
    this._onExternalOpen = () => this.open();
    this._onExternalClose = () => this.close();
    this.el.addEventListener('essence:collapsible:open', this._onExternalOpen);
    this.el.addEventListener('essence:collapsible:close', this._onExternalClose);

    if (this.el.dataset.state === 'open') {
      this.open(true);
    }

    // Reset mount animation prevention after first frame
    requestAnimationFrame(() => {
      this.isMountAnimationPrevented = false;
    });
  },

  destroyed() {
    this.content?.removeEventListener('animationend', this._onAnimationEnd);
    this.content?.removeEventListener('transitionend', this._onAnimationEnd);
    this.el.removeEventListener('essence:collapsible:open', this._onExternalOpen);
    this.el.removeEventListener('essence:collapsible:close', this._onExternalClose);
  },

  open(isInitial = false) {
    if (!this.content) return;

    this.el.dataset.state = 'open';
    if (!isInitial) this.pushOpenChange(true);
    if (this.trigger) {
      this.trigger.setAttribute('aria-expanded', 'true');
      this.trigger.dataset.state = 'open';
    }

    // Dimension retrieval (Radix pattern)
    const node = this.content;
    const originalStyles = {
      transitionDuration: node.style.transitionDuration,
      animationName: node.style.animationName,
      display: node.style.display,
    };

    // Block any animations/transitions so the element renders at its full dimensions
    node.style.transitionDuration = '0s';
    node.style.animationName = 'none';
    
    // Ensure it's not hidden and has a display for measurement
    node.hidden = false;
    node.style.display = 'block'; 

    // Use scrollHeight for robust height measurement
    const height = node.scrollHeight;
    const width = node.getBoundingClientRect().width;

    // Set all possible variable names for compatibility
    node.style.setProperty('--essence-collapsible-content-height', `${height}px`);
    node.style.setProperty('--essence-collapsible-content-width', `${width}px`);
    node.style.setProperty('--radix-collapsible-content-height', `${height}px`);
    node.style.setProperty('--radix-collapsible-content-width', `${width}px`);

    // Restore styles
    node.style.display = originalStyles.display;
    if (!this.isMountAnimationPrevented && !isInitial) {
      node.style.transitionDuration = originalStyles.transitionDuration;
      node.style.animationName = originalStyles.animationName;
    } else if (isInitial) {
      // For initial mount, we still need to clear the overrides so that
      // subsequent close transitions (which are NOT initial) work properly.
      requestAnimationFrame(() => {
        node.style.transitionDuration = originalStyles.transitionDuration;
        node.style.animationName = originalStyles.animationName;
      });
    }

    node.dataset.state = 'open';
  },

  close() {
    if (!this.content) return;

    this.el.dataset.state = 'closed';
    this.pushOpenChange(false);
    if (this.trigger) {
      this.trigger.setAttribute('aria-expanded', 'false');
      this.trigger.dataset.state = 'closed';
    }

    this.content.dataset.state = 'closed';
    
    // Presence logic: Wait for animations/transitions to end before hiding
    // If no animations are detected after a tick, hide immediately
    setTimeout(() => {
      const style = getComputedStyle(this.content);
      const hasAnimation = style.animationName !== 'none' && parseFloat(style.animationDuration) > 0;
      const hasTransition = style.transitionProperty !== 'none' && parseFloat(style.transitionDuration) > 0;
      
      if (!hasAnimation && !hasTransition && this.el.dataset.state === 'closed') {
        this.content.hidden = true;
      }
    }, 50); // Small delay to allow CSS state changes to reflect in computed style
  },

  pushOpenChange(open) {
    const event = this.el.dataset.onOpenChange;
    if (event) this.pushEvent(event, { open });
  }
};
