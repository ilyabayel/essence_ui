export const CollapsibleRoot = {
  mounted() {
    this.trigger = this.el.querySelector('[data-essence-collapsible-trigger]');
    this.content = this.el.querySelector('[data-essence-collapsible-content]');
    this.disabled = this.el.dataset.disabled === 'true';
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
  },

  open(isInitial = false) {
    if (!this.content) return;

    this.el.dataset.state = 'open';
    if (this.trigger) {
      this.trigger.setAttribute('aria-expanded', 'true');
      this.trigger.dataset.state = 'open';
    }

    // Dimension retrieval (Radix pattern)
    const node = this.content;
    const originalStyles = {
      transitionDuration: node.style.transitionDuration,
      animationName: node.style.animationName,
    };

    // Block any animations/transitions so the element renders at its full dimensions
    node.style.transitionDuration = '0s';
    node.style.animationName = 'none';
    node.hidden = false;

    // Get width and height from full dimensions
    const rect = node.getBoundingClientRect();
    const height = rect.height;
    const width = rect.width;

    node.style.setProperty('--essence-collapsible-content-height', `${height}px`);
    node.style.setProperty('--essence-collapsible-content-width', `${width}px`);

    // Kick off any animations/transitions that were originally set up if it isn't the initial mount
    if (!this.isMountAnimationPrevented && !isInitial) {
      node.style.transitionDuration = originalStyles.transitionDuration;
      node.style.animationName = originalStyles.animationName;
    }

    node.dataset.state = 'open';
  },

  close() {
    if (!this.content) return;

    this.el.dataset.state = 'closed';
    if (this.trigger) {
      this.trigger.setAttribute('aria-expanded', 'false');
      this.trigger.dataset.state = 'closed';
    }

    this.content.dataset.state = 'closed';
    // We do NOT set hidden = true here. 
    // The animationend/transitionend listener will handle it for Presence.
    
    // If no animations/transitions are active, hidden should be set immediately.
    // We check this by seeing if the element is still visible after a short tick 
    // if the user didn't define any animations.
    requestAnimationFrame(() => {
      const style = getComputedStyle(this.content);
      const hasAnimation = style.animationName !== 'none' && style.animationDuration !== '0s';
      const hasTransition = style.transitionProperty !== 'none' && style.transitionDuration !== '0s';
      
      if (!hasAnimation && !hasTransition) {
        this.content.hidden = true;
      }
    });
  }
};
