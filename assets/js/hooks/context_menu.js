/**
 * ContextMenu Hook
 * 
 * Handles right-click events and positions the context menu relative to the cursor.
 */
export const ContextMenu = {
  mounted() {
    this.trigger = this.el.querySelector('[data-context-menu-trigger]');
    this.content = this.el.querySelector('[data-context-menu-content]');
    if (!this.trigger || !this.content) return;

    this.onContextMenu = this.onContextMenu.bind(this);
    this.onClickOutside = this.onClickOutside.bind(this);
    this.onMenuItemClick = this.onMenuItemClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    
    this.trigger.addEventListener('contextmenu', this.onContextMenu);
    document.addEventListener('click', this.onClickOutside);
    document.addEventListener('contextmenu', this.onClickOutside);
    document.addEventListener('keydown', this.onKeyDown);
    
    this.bindHoverEvents();
  },

  updated() {
    this.bindHoverEvents();
    if (this.content) {
      this.items = this.content.querySelectorAll('.rt-ContextMenuItem:not([data-disabled])');
      this.items.forEach(item => {
        if (!item.hasAttribute('data-has-click')) {
          item.addEventListener('click', this.onMenuItemClick);
          item.setAttribute('data-has-click', 'true');
        }
      });
    }
  },

  onContextMenu(e) {
    e.preventDefault();
    e.stopPropagation();
    
    // Close other context menus
    document.querySelectorAll('[data-context-menu-content]').forEach(el => {
      if (el !== this.content) {
        el.style.display = 'none';
      }
    });

    this.content.style.display = 'flex';
    this.content.style.position = 'fixed';
    this.content.style.zIndex = '9999';
    
    // Bind click events on items
    this.items = this.content.querySelectorAll('.rt-ContextMenuItem:not([data-disabled])');
    this.items.forEach(item => {
      if (!item.hasAttribute('data-has-click')) {
        item.addEventListener('click', this.onMenuItemClick);
        item.setAttribute('data-has-click', 'true');
      }
    });

    // Position menu based on click coordinates
    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;
    
    // Get natural dimensions by making it temporarily visible but hidden
    const rect = this.content.getBoundingClientRect();
    
    let x = e.clientX;
    let y = e.clientY;
    
    if (x + rect.width > viewportWidth) {
      x = viewportWidth - rect.width - 8;
    }
    if (y + rect.height > viewportHeight) {
      y = viewportHeight - rect.height - 8;
    }
    
    this.content.style.left = `${x}px`;
    this.content.style.top = `${y}px`;
  },

  onClickOutside(e) {
    if (this.content && this.content.contains(e.target)) return;
    if (e.type === 'contextmenu' && this.trigger && this.trigger.contains(e.target)) return;
    this.closeMenu();
  },

  onKeyDown(e) {
    if (e.key === 'Escape') {
      this.closeMenu();
    }
  },

  onMenuItemClick(e) {
    if (e.currentTarget.hasAttribute('data-context-menu-sub-trigger')) return;
    
    // Allow LiveView events to process before closing
    setTimeout(() => this.closeMenu(), 50);
  },

  closeMenu() {
    if (this.content) {
      this.content.style.display = 'none';
      this.content.querySelectorAll('[data-context-menu-sub-content]').forEach(el => {
        el.style.display = 'none';
      });
      this.content.querySelectorAll('[data-context-menu-sub-trigger]').forEach(el => {
        el.removeAttribute('data-state');
      });
    }
  },

  bindHoverEvents() {
    if (!this.content) return;
    
    // Submenus
    const subs = this.content.querySelectorAll('[data-context-menu-sub]');
    subs.forEach(sub => {
      if (sub.hasAttribute('data-has-hover')) return;
      sub.setAttribute('data-has-hover', 'true');
      
      const trigger = sub.querySelector('[data-context-menu-sub-trigger]');
      const content = sub.querySelector('[data-context-menu-sub-content]');
      if (!trigger || !content) return;

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

        if (left + cRect.width > viewportWidth) left = tRect.left - cRect.width + 4;
        if (top + cRect.height > viewportHeight) top = viewportHeight - cRect.height - 8;

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
    const allItems = this.content.querySelectorAll('.rt-ContextMenuItem:not([data-disabled])');
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
    if (this.trigger) this.trigger.removeEventListener('contextmenu', this.onContextMenu);
    document.removeEventListener('click', this.onClickOutside);
    document.removeEventListener('contextmenu', this.onClickOutside);
    document.removeEventListener('keydown', this.onKeyDown);
  }
};
