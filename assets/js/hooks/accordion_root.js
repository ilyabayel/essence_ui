export const AccordionRoot = {
  mounted() {
    this.type = this.el.dataset.type || "single";
    this.collapsible = this.el.dataset.collapsible === "true";
    this.refreshItems();

    this.el.addEventListener('keydown', (e) => {
      const activeElement = document.activeElement;
      if (!this.el.contains(activeElement)) return;
      
      const trigger = activeElement.closest('[data-essence-accordion-trigger]');
      if (!trigger) return;

      const triggers = this.items.map(item => item.querySelector('[data-essence-accordion-trigger]')).filter(Boolean);
      const index = triggers.indexOf(trigger);

      switch (e.key) {
        case 'ArrowDown':
          e.preventDefault();
          triggers[(index + 1) % triggers.length]?.focus();
          break;
        case 'ArrowUp':
          e.preventDefault();
          triggers[(index - 1 + triggers.length) % triggers.length]?.focus();
          break;
        case 'Home':
          e.preventDefault();
          triggers[0]?.focus();
          break;
        case 'End':
          e.preventDefault();
          triggers[triggers.length - 1]?.focus();
          break;
      }
    });
  },

  refreshItems() {
    // We use a custom attribute data-essence-accordion-item to avoid conflict with existing classes
    this.items = Array.from(this.el.querySelectorAll('[data-essence-accordion-item]'));

    this.items.forEach(item => {
      const trigger = item.querySelector('[data-essence-accordion-trigger]');
      const content = item.querySelector('[data-essence-accordion-content]');

      if (!trigger || !content) return;

      // Ensure we don't attach multiple listeners if mounted is called again (though LiveView usually handles this)
      if (trigger._accordion_initialized) return;
      trigger._accordion_initialized = true;

      trigger.addEventListener('click', () => {
        const isOpen = item.dataset.state === 'open';
        
        if (this.type === 'single') {
          if (!isOpen) {
            this.closeAll();
            this.openItem(item);
          } else if (this.collapsible) {
            this.closeItem(item);
          }
        } else {
          // multiple mode
          if (isOpen) {
            this.closeItem(item);
          } else {
            this.openItem(item);
          }
        }
      });
      
      if (item.dataset.state === 'open') {
        this.updateHeight(content);
      }
    });
  },

  updateHeight(content) {
    const height = content.scrollHeight;
    content.style.setProperty('--essence-accordion-content-height', `${height}px`);
  },

  openItem(item) {
    const content = item.querySelector('[data-essence-accordion-content]');
    const trigger = item.querySelector('[data-essence-accordion-trigger]');

    this.updateHeight(content);

    item.dataset.state = 'open';
    if (trigger) {
        trigger.dataset.state = 'open';
        trigger.setAttribute('aria-expanded', 'true');
    }
    if (content) {
        content.dataset.state = 'open';
        content.hidden = false;
    }
  },

  closeItem(item) {
    const content = item.querySelector('[data-essence-accordion-content]');
    const trigger = item.querySelector('[data-essence-accordion-trigger]');

    item.dataset.state = 'closed';
    if (trigger) {
        trigger.dataset.state = 'closed';
        trigger.setAttribute('aria-expanded', 'false');
    }
    if (content) {
        content.dataset.state = 'closed';
        content.hidden = true;
    }
  },

  closeAll() {
    this.items.forEach(item => {
      if (item.dataset.state === 'open') {
        this.closeItem(item);
      }
    });
  }
};
