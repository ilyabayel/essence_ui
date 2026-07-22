/**
 * SelectRoot Hook
 * 
 * Handles click events to toggle the select menu, item selection, 
 * keyboard navigation, and positions it relative to the trigger.
 */
export const SelectRoot = {
  mounted() {
    this.init();
    
    if (this.trigger && this.content) {
      this.trigger.setAttribute('aria-controls', this.content.id);
      this.content.setAttribute('aria-labelledby', this.trigger.id);
    }

    if (this.valueDisplay) {
      this.valueDisplay.style.whiteSpace = 'nowrap';
    }
    
    this.onToggle = this.onToggle.bind(this);
    this.onClickOutside = this.onClickOutside.bind(this);
    this.onItemClick = this.onItemClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.isOpen = false;
    this.searchQuery = "";
    this.searchTimeout = null;
    
    this.el.addEventListener('click', e => {
      const trigger = e.target.closest('[data-essence-select-trigger]');
      if (trigger && this.el.contains(trigger)) {
        this.onToggle(e);
      }
    });

    document.addEventListener('click', this.onClickOutside);
    document.addEventListener('keydown', this.onKeyDown);
    
    this.syncValue();
    this.bindHoverEvents();
    this.el.setAttribute('data-hydrated', '');
  },

  updated() {
    this.init();
    if (this.valueDisplay) {
      this.valueDisplay.style.whiteSpace = 'nowrap';
    }
    this.syncValue();
    this.bindHoverEvents();
  },

  init() {
    this.root = this.el;
    this.trigger = this.el.querySelector('[data-essence-select-trigger]');
    this.content = this.el.querySelector('[data-essence-select-content]');
    this.valueDisplay = this.el.querySelector('[data-essence-select-value]');
  },

  onToggle(e) {
    e.preventDefault();
    e.stopPropagation();
    
    if (this.isOpen) {
      this.closeMenu();
    } else {
      this.openMenu();
    }
  },

  openMenu() {
    if (this.root.hasAttribute('data-disabled')) return;

    // Close other menus if any
    document.querySelectorAll('[data-essence-select-content]').forEach(el => {
      if (el !== this.content) el.style.display = 'none';
    });

    this.content.style.display = 'flex';
    this.content.style.flexDirection = 'column';
    this.isOpen = true;
    this.trigger.setAttribute('aria-expanded', 'true');
    this.content.setAttribute('data-state', 'open');
    this.trigger.setAttribute('data-state', 'open');

    this.positionMenu();
    this.syncValue(); // Ensure indicators are correct

    // Focus selected item or first item
    const selectedItem = this.content.querySelector('[aria-selected="true"]');
    if (selectedItem) {
      selectedItem.focus();
    } else {
      const firstItem = this.content.querySelector('[data-essence-select-item]:not([data-disabled])');
      if (firstItem) firstItem.focus();
    }
  },

  closeMenu() {
    if (!this.isOpen) return;
    this.isOpen = false;
    this.content.style.display = 'none';
    this.trigger.setAttribute('aria-expanded', 'false');
    this.content.setAttribute('data-state', 'closed');
    this.trigger.setAttribute('data-state', 'closed');
    this.trigger.focus();
  },

  positionMenu() {
    const position = this.content.getAttribute('data-position') || 'item-aligned';
    
    if (position === 'popper') {
      this.positionPopper();
    } else {
      this.positionItemAligned();
    }
  },

  positionPopper() {
    const tRect = this.trigger.getBoundingClientRect();
    const cRect = this.content.getBoundingClientRect();
    const viewportHeight = window.innerHeight;
    const viewportWidth = window.innerWidth;

    let top = tRect.bottom + 4;
    let left = tRect.left;
    
    if (top + cRect.height > viewportHeight) {
      top = tRect.top - cRect.height - 4;
    }

    if (left + cRect.width > viewportWidth) {
      left = viewportWidth - cRect.width - 4;
    }
    
    if (left < 4) left = 4;
    if (top < 4) top = 4;

    this.content.style.top = `${top}px`;
    this.content.style.left = `${left}px`;
    this.content.style.minWidth = `${tRect.width}px`;
  },

  positionItemAligned() {
    const tRect = this.trigger.getBoundingClientRect();
    const selectedItem = this.content.querySelector('[aria-selected="true"]') || 
                         this.content.querySelector('[data-essence-select-item]:not([data-disabled])');
    
    if (!selectedItem) {
      this.positionPopper();
      return;
    }

    const cRect = this.content.getBoundingClientRect();
    const viewportHeight = window.innerHeight;
    
    // Aligner logic: center of trigger aligns with center of selected item
    const tCenter = tRect.top + tRect.height / 2;
    const iRect = selectedItem.getBoundingClientRect();
    const iCenter = iRect.top - cRect.top + iRect.height / 2;
    
    let top = tCenter - iCenter;
    let left = tRect.left;

    // Boundary checks
    if (top < 4) top = 4;
    if (top + cRect.height > viewportHeight - 4) {
      top = viewportHeight - cRect.height - 4;
    }

    this.content.style.top = `${top}px`;
    this.content.style.left = `${left}px`;
    this.content.style.minWidth = `${tRect.width}px`;
  },

  onClickOutside(e) {
    if (!this.isOpen) return;
    if (this.content.contains(e.target)) return;
    if (this.trigger.contains(e.target)) return;
    this.closeMenu();
  },

  onItemClick(e) {
    const item = e.currentTarget;
    if (item.hasAttribute('data-disabled')) return;

    const value = item.getAttribute('data-value');
    this.selectValue(value);
    this.closeMenu();
  },

  selectValue(value) {
    this.root.setAttribute('data-value', value);
    this.syncValue();
    
    // Push event to server if configured
    const onChangeEvent = this.root.getAttribute('phx-change') || this.root.getAttribute('data-on-change');
    if (onChangeEvent) {
      this.pushEvent(onChangeEvent, { value: value });
    }
    
    // Also update hidden input if present
    const input = this.root.querySelector('input[type="hidden"]');
    if (input) {
      input.value = value;
      input.dispatchEvent(new Event('change', { bubbles: true }));
    }
  },

  syncValue() {
    const currentValue = this.root.getAttribute('data-value');
    const items = this.content.querySelectorAll('[data-essence-select-item]');
    
    let selectedText = null;

    items.forEach(item => {
      const itemValue = item.getAttribute('data-value');
      const isSelected = itemValue === currentValue;
      
      item.setAttribute('aria-selected', isSelected.toString());
      if (isSelected) {
        item.setAttribute('data-state', 'checked');
        const textPart = item.querySelector('[data-essence-select-item-text]');
        selectedText = item.getAttribute('data-text-value') || (textPart ? textPart.innerText : item.innerText).trim();
      } else {
        item.removeAttribute('data-state');
      }

      const indicator = item.querySelector('[data-essence-select-item-indicator]');
      if (indicator) {
        indicator.style.display = isSelected ? 'inline-flex' : 'none';
      }
      
      if (!item.hasAttribute('data-has-click')) {
        item.addEventListener('click', this.onItemClick);
        item.setAttribute('data-has-click', 'true');
      }
    });

    if (selectedText && this.valueDisplay) {
      if (this.valueDisplay.innerText.trim() !== selectedText) {
        this.valueDisplay.innerText = selectedText;
      }
      this.valueDisplay.removeAttribute('data-placeholder');
    }
  },

  onKeyDown(e) {
    if (this.isOpen) {
      if (e.key === 'Escape') {
        this.closeMenu();
        return;
      }

      const items = Array.from(this.content.querySelectorAll('[data-essence-select-item]:not([data-disabled])'));
      const currentIndex = items.indexOf(document.activeElement);

      if (e.key === 'ArrowDown') {
        e.preventDefault();
        const nextIndex = (currentIndex + 1) % items.length;
        items[nextIndex].focus();
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        const prevIndex = (currentIndex - 1 + items.length) % items.length;
        items[prevIndex].focus();
      } else if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        if (currentIndex !== -1) {
          this.selectValue(items[currentIndex].getAttribute('data-value'));
          this.closeMenu();
        }
      } else if (e.key.length === 1) {
        // Type-to-select
        this.handleTypeSelect(e.key, items);
      }
    } else if (document.activeElement === this.trigger) {
      if (e.key === 'ArrowDown' || e.key === 'ArrowUp' || e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        this.openMenu();
      }
    }
  },

  handleTypeSelect(key, items) {
    clearTimeout(this.searchTimeout);
    this.searchQuery += key.toLowerCase();
    this.searchTimeout = setTimeout(() => { this.searchQuery = ""; }, 500);

    const match = items.find(item => {
      const text = (item.getAttribute('data-text-value') || item.innerText).toLowerCase().trim();
      return text.startsWith(this.searchQuery);
    });

    if (match) match.focus();
  },

  bindHoverEvents() {
    const items = this.content.querySelectorAll('[data-essence-select-item]:not([data-disabled])');
    items.forEach(item => {
      if (item.hasAttribute('data-has-hover')) return;
      item.setAttribute('data-has-hover', 'true');
      
      item.addEventListener('mouseenter', () => {
        item.focus();
        item.setAttribute('data-highlighted', '');
      });
      item.addEventListener('mouseleave', () => {
        item.removeAttribute('data-highlighted');
      });
    });
  },

  destroyed() {
    if (this.trigger) {
      this.trigger.removeEventListener('click', this.onToggle);
    }
    document.removeEventListener('click', this.onClickOutside);
    document.removeEventListener('keydown', this.onKeyDown);
  }
};
