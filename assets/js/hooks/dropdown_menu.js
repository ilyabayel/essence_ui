/**
 * DropdownMenu Hook
 * 
 * Handles click events to toggle the dropdown menu and positions it relative to the trigger.
 */
export const DropdownMenu = {
  mounted() {
    this.trigger = this.el.querySelector('[data-dropdown-menu-trigger]');
    this.content = this.el.querySelector('[data-dropdown-menu-content]');
    if (!this.trigger || !this.content) return;

    this.onToggle = this.onToggle.bind(this);
    this.onClickOutside = this.onClickOutside.bind(this);
    this.onMenuItemClick = this.onMenuItemClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.isOpen = false;
    
    // We expect the trigger to contain a button or be clickable
    const triggerEl = this.trigger.firstElementChild || this.trigger;
    triggerEl.addEventListener('click', this.onToggle);
    
    document.addEventListener('click', this.onClickOutside);
    document.addEventListener('keydown', this.onKeyDown);
    
    this.bindHoverEvents();
  },

  updated() {
    this.bindHoverEvents();
    if (this.content) {
      this.items = this.content.querySelectorAll('.rt-DropdownMenuItem:not([data-disabled])');
      this.items.forEach(item => {
        if (!item.hasAttribute('data-has-click')) {
          item.addEventListener('click', this.onMenuItemClick);
          item.setAttribute('data-has-click', 'true');
        }
      });
    }
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
    // Close other dropdown menus
    document.querySelectorAll('[data-dropdown-menu-content]').forEach(el => {
      if (el !== this.content) {
        el.style.display = 'none';
      }
    });

    this.content.style.display = 'flex';
    this.content.style.position = 'fixed';
    this.isOpen = true;
    
    // Bind click events on items
    this.items = this.content.querySelectorAll('.rt-DropdownMenuItem:not([data-disabled])');
    this.items.forEach(item => {
      if (!item.hasAttribute('data-has-click')) {
        item.addEventListener('click', this.onMenuItemClick);
        item.setAttribute('data-has-click', 'true');
      }
    });

    // Positioning relative to viewport
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
    
    this.content.style.top = `${top}px`;
    this.content.style.left = `${left}px`;
  },

  onClickOutside(e) {
    if (!this.isOpen) return;
    if (this.content && this.content.contains(e.target)) return;
    if (this.trigger && this.trigger.contains(e.target)) return;
    this.closeMenu();
  },

  onKeyDown(e) {
    if (!this.isOpen) return;
    if (e.key === 'Escape') {
      this.closeMenu();
    }
  },

  onMenuItemClick(e) {
    if (e.currentTarget.hasAttribute('data-dropdown-menu-sub-trigger')) return;
    
    // Toggle checkbox/radio visually for demo purposes if present
    const isCheckbox = e.currentTarget.getAttribute('role') === 'menuitemcheckbox';
    const isRadio = e.currentTarget.getAttribute('role') === 'menuitemradio';
    
    if (isCheckbox) {
      const isChecked = e.currentTarget.getAttribute('aria-checked') === 'true';
      e.currentTarget.setAttribute('aria-checked', (!isChecked).toString());
      // Re-render icon roughly (for preview, normally server handled)
      const indicator = e.currentTarget.querySelector('.rt-BaseMenuItemIndicator');
      if (indicator) {
        if (!isChecked) {
          indicator.innerHTML = '<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" class="rt-BaseMenuItemIndicatorIcon"><path d="M11.4669 3.72684C11.7558 3.91574 11.8369 4.30308 11.648 4.59198L7.39799 11.092C7.29783 11.2452 7.13556 11.3467 6.95402 11.3699C6.77247 11.3931 6.58989 11.3355 6.45446 11.2124L3.70446 8.71241C3.44905 8.48022 3.43023 8.08494 3.66242 7.82953C3.89461 7.57412 4.28989 7.55529 4.5453 7.78749L6.75292 9.79441L10.6018 3.90792C10.7907 3.61902 11.178 3.53795 11.4669 3.72684Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>';
        } else {
          indicator.innerHTML = '';
        }
      }
    } else if (isRadio) {
      // Uncheck siblings in the same group
      const parent = e.currentTarget.closest('[role="menu"], .rt-BaseMenuViewport');
      if (parent) {
        parent.querySelectorAll('[role="menuitemradio"]').forEach(radio => {
          radio.setAttribute('aria-checked', 'false');
          const ind = radio.querySelector('.rt-BaseMenuItemIndicator');
          if (ind) ind.innerHTML = '';
        });
      }
      e.currentTarget.setAttribute('aria-checked', 'true');
      const indicator = e.currentTarget.querySelector('.rt-BaseMenuItemIndicator');
      if (indicator) {
        indicator.innerHTML = '<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" class="rt-BaseMenuItemIndicatorIcon"><path d="M7.5 10C8.88071 10 10 8.88071 10 7.5C10 6.11929 8.88071 5 7.5 5C6.11929 5 5 6.11929 5 7.5C5 8.88071 6.11929 10 7.5 10Z" fill="currentColor"></path></svg>';
      }
    }
    
    // Allow LiveView events to process before closing unless it's a checkbox/radio
    if (!isCheckbox && !isRadio) {
      setTimeout(() => this.closeMenu(), 50);
    }
  },

  closeMenu() {
    this.isOpen = false;
    if (this.content) {
      this.content.style.display = 'none';
      this.content.querySelectorAll('[data-dropdown-menu-sub-content]').forEach(el => {
        el.style.display = 'none';
      });
      this.content.querySelectorAll('[data-dropdown-menu-sub-trigger]').forEach(el => {
        el.removeAttribute('data-state');
      });
    }
  },

  bindHoverEvents() {
    if (!this.content) return;
    
    // Submenus
    const subs = this.content.querySelectorAll('[data-dropdown-menu-sub]');
    subs.forEach(sub => {
      if (sub.hasAttribute('data-has-hover')) return;
      sub.setAttribute('data-has-hover', 'true');
      
      const trigger = sub.querySelector('[data-dropdown-menu-sub-trigger]');
      const content = sub.querySelector('[data-dropdown-menu-sub-content]');
      if (!trigger || !content) return;

      // Copy context classes (size, variant, color) from parent to submenu to inherit styling (like border radius)
      const parentClasses = Array.from(this.content.classList).filter(c => 
        c.startsWith('rt-r-size-') || 
        c.startsWith('rt-variant-') || 
        c === 'rt-high-contrast' || 
        c.startsWith('rt-r-color-') ||
        c.startsWith('rt-r-gray-color-')
      );
      if (parentClasses.length > 0) {
        content.classList.add(...parentClasses);
      }

      let timeout;
      
      const openSub = () => {
        clearTimeout(timeout);
        trigger.setAttribute('data-state', 'open');
        trigger.setAttribute('data-highlighted', '');
        content.style.display = 'flex';
        content.style.position = 'fixed';
        content.style.zIndex = '10000';
        
        const tRect = trigger.getBoundingClientRect();
        
        // Show temporarily to get actual dimensions
        const cRect = content.getBoundingClientRect();
        
        const viewportWidth = window.innerWidth;
        const viewportHeight = window.innerHeight;

        let left = tRect.right - 4; // slight overlap
        let top = tRect.top - 4; // align top

        if (left + cRect.width > viewportWidth) {
           left = tRect.left - cRect.width + 4; // open to the left
        }
        
        if (top + cRect.height > viewportHeight) {
           top = viewportHeight - cRect.height - 8;
        }

        content.style.left = `${left}px`;
        content.style.top = `${top}px`;
      };

      const closeSub = () => {
        timeout = setTimeout(() => {
          trigger.removeAttribute('data-state');
          trigger.removeAttribute('data-highlighted');
          content.style.display = 'none';
        }, 150);
      };

      trigger.addEventListener('mouseenter', openSub);
      trigger.addEventListener('mouseleave', closeSub);
      content.addEventListener('mouseenter', () => clearTimeout(timeout));
      content.addEventListener('mouseleave', closeSub);
    });
    
    // Highlighting for all items
    const allItems = this.content.querySelectorAll('.rt-DropdownMenuItem:not([data-disabled])');
    allItems.forEach(item => {
      if (item.hasAttribute('data-has-hover')) return;
      item.setAttribute('data-has-hover', 'true');
      
      item.addEventListener('mouseenter', () => {
        allItems.forEach(i => i.removeAttribute('data-highlighted'));
        item.setAttribute('data-highlighted', '');
      });
      item.addEventListener('mouseleave', () => {
        item.removeAttribute('data-highlighted');
      });
    });
  },

  destroyed() {
    if (this.trigger) {
      const triggerEl = this.trigger.firstElementChild || this.trigger;
      triggerEl.removeEventListener('click', this.onToggle);
    }
    document.removeEventListener('click', this.onClickOutside);
    document.removeEventListener('keydown', this.onKeyDown);
  }
};
