export const Tabs = {
  mounted() {
    this.tablist = this.el.querySelector('[role="tablist"]');
    this.triggers = Array.from(this.el.querySelectorAll('[role="tab"]'));
    this.contents = Array.from(this.el.querySelectorAll('[role="tabpanel"]'));

    // Set up click handlers
    this.triggers.forEach(trigger => {
      trigger.addEventListener('click', (e) => {
        if (!trigger.disabled) {
          this.activateTab(trigger.dataset.value);
        }
      });
    });

    // Set up keyboard navigation
    this.tablist.addEventListener('keydown', (e) => {
      const currentIndex = this.triggers.findIndex(t => t.dataset.state === 'active');
      let newIndex = currentIndex;

      if (e.key === 'ArrowLeft') {
        e.preventDefault();
        newIndex = currentIndex > 0 ? currentIndex - 1 : this.triggers.length - 1;
      } else if (e.key === 'ArrowRight') {
        e.preventDefault();
        newIndex = currentIndex < this.triggers.length - 1 ? currentIndex + 1 : 0;
      } else if (e.key === 'Home') {
        e.preventDefault();
        newIndex = 0;
      } else if (e.key === 'End') {
        e.preventDefault();
        newIndex = this.triggers.length - 1;
      }

      if (newIndex !== currentIndex && !this.triggers[newIndex].disabled) {
        this.activateTab(this.triggers[newIndex].dataset.value);
        this.triggers[newIndex].focus();
      }
    });
  },

  activateTab(value) {
    // Update triggers
    this.triggers.forEach(trigger => {
      const isActive = trigger.dataset.value === value;
      trigger.dataset.state = isActive ? 'active' : 'inactive';
      trigger.setAttribute('aria-selected', isActive ? 'true' : 'false');
      trigger.setAttribute('tabindex', isActive ? '0' : '-1');
    });

    // Update content panels
    this.contents.forEach(content => {
      const isActive = content.id.endsWith(`-${value}`);
      content.dataset.state = isActive ? 'active' : 'inactive';
      content.hidden = !isActive;
    });
  }
};
