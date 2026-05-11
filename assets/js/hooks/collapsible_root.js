export const CollapsibleRoot = {
  mounted() {
    this.trigger = this.el.querySelector('[data-essence-collapsible-trigger]');
    this.content = this.el.querySelector('[data-essence-collapsible-content]');

    if (this.trigger && this.content) {
      this.trigger.addEventListener('click', () => {
        const isOpen = this.el.dataset.state === 'open';
        if (isOpen) {
          this.close();
        } else {
          this.open();
        }
      });
    }

    if (this.el.dataset.state === 'open') {
        this.open();
    }
  },

  open() {
    this.el.dataset.state = 'open';
    if (this.trigger) {
        this.trigger.setAttribute('aria-expanded', 'true');
        this.trigger.dataset.state = 'open';
    }
    if (this.content) {
        this.content.hidden = false;
        this.content.dataset.state = 'open';
    }
  },

  close() {
    this.el.dataset.state = 'closed';
    if (this.trigger) {
        this.trigger.setAttribute('aria-expanded', 'false');
        this.trigger.dataset.state = 'closed';
    }
    if (this.content) {
        this.content.hidden = true;
        this.content.dataset.state = 'closed';
    }
  }
};
