export const AccordionRoot = {
  mounted() {
    this.type = this.el.dataset.type || "single";
    this.collapsible = this.el.dataset.collapsible === "true";
    this.orientation = this.el.dataset.orientation || "vertical";
    this.dir = this.el.getAttribute("dir") || "ltr";

    // Coordination via event delegation (capture phase to intercept Collapsible click)
    this.el.addEventListener('click', (e) => {
      const trigger = e.target.closest('[data-essence-accordion-trigger]');
      if (!trigger) return;

      const item = trigger.closest('[data-essence-accordion-item]');
      if (!item || item.dataset.disabled === 'true') return;

      const isOpen = item.dataset.state === 'open';

      if (this.type === 'single') {
        if (isOpen) {
          if (this.collapsible) {
            // Allow closing
          } else {
            // Prevent closing by stopping propagation
            e.stopImmediatePropagation();
            e.preventDefault();
          }
        } else {
          // Opening: close others
          this.closeAllExcept(item);
        }
      }
    }, true);

    // Keyboard navigation
    this.el.addEventListener('keydown', (e) => {
      const target = e.target;
      if (!target.closest('[data-essence-accordion-trigger]')) return;

      const items = Array.from(this.el.querySelectorAll('[data-essence-accordion-item]'));
      const triggers = items
        .map(i => i.querySelector('[data-essence-accordion-trigger]'))
        .filter(t => t && t.closest('[data-essence-accordion-item]').dataset.disabled !== 'true');
      
      const index = triggers.indexOf(target);
      if (index === -1) return;

      const isLtr = this.dir === 'ltr';
      const isVertical = this.orientation === 'vertical';
      const isHorizontal = this.orientation === 'horizontal';

      let nextIndex = index;
      const count = triggers.length;

      const moveNext = () => { nextIndex = (index + 1) % count; };
      const movePrev = () => { nextIndex = (index - 1 + count) % count; };

      switch (e.key) {
        case 'Home':
          e.preventDefault();
          nextIndex = 0;
          break;
        case 'End':
          e.preventDefault();
          nextIndex = count - 1;
          break;
        case 'ArrowDown':
          if (isVertical) {
            e.preventDefault();
            moveNext();
          }
          break;
        case 'ArrowUp':
          if (isVertical) {
            e.preventDefault();
            movePrev();
          }
          break;
        case 'ArrowRight':
          if (isHorizontal) {
            e.preventDefault();
            isLtr ? moveNext() : movePrev();
          }
          break;
        case 'ArrowLeft':
          if (isHorizontal) {
            e.preventDefault();
            isLtr ? movePrev() : moveNext();
          }
          break;
        default:
          return;
      }

      if (nextIndex !== index) {
        triggers[nextIndex].focus();
      }
    });
  },

  closeAllExcept(activeItem) {
    const items = this.el.querySelectorAll('[data-essence-accordion-item]');
    items.forEach(item => {
      if (item !== activeItem && item.dataset.state === 'open') {
        item.dispatchEvent(new CustomEvent('essence:collapsible:close', { bubbles: false }));
      }
    });
  }
};
