export const Accordion = {
  mounted() {
    this.type = this.el.dataset.type || "single";
    this.collapsible = this.el.dataset.collapsible === "true";
    this.items = Array.from(this.el.querySelectorAll('.AccordionItem'));

    this.items.forEach(item => {
      const trigger = item.querySelector('.AccordionTrigger');
      const content = item.querySelector('.AccordionContent');

      if (!trigger || !content) return;

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
      
      // Initialize height for items that are open by default
      if (item.dataset.state === 'open') {
        this.updateHeight(content);
      }
    });
  },

  updateHeight(content) {
    // Temporarily remove animation to measure height accurately if needed
    // but usually scrollHeight works even if collapsed
    const height = content.scrollHeight;
    content.style.setProperty('--radix-accordion-content-height', `${height}px`);
  },

  openItem(item) {
    const content = item.querySelector('.AccordionContent');
    const trigger = item.querySelector('.AccordionTrigger');

    this.updateHeight(content);

    item.dataset.state = 'open';
    trigger.dataset.state = 'open';
    content.dataset.state = 'open';
    trigger.setAttribute('aria-expanded', 'true');
  },

  closeItem(item) {
    const content = item.querySelector('.AccordionContent');
    const trigger = item.querySelector('.AccordionTrigger');

    this.updateHeight(content);

    item.dataset.state = 'closed';
    trigger.dataset.state = 'closed';
    content.dataset.state = 'closed';
    trigger.setAttribute('aria-expanded', 'false');
  },

  closeAll() {
    this.items.forEach(item => {
      if (item.dataset.state === 'open') {
        this.closeItem(item);
      }
    });
  }
};
