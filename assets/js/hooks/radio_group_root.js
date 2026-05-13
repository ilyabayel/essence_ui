/**
 * RadioGroupRoot Hook
 * 
 * Handles keyboard navigation and selection for radio group items.
 */
export const RadioGroupRoot = {
  mounted() {
    this.onItemClick = this.onItemClick.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    
    this.el.addEventListener('keydown', this.onKeyDown);
    this.syncValue();
  },

  updated() {
    this.syncValue();
  },

  syncValue() {
    const currentValue = this.el.getAttribute('data-value');
    const items = Array.from(this.el.querySelectorAll('[data-essence-radio-group-item]'));
    const isRootDisabled = this.el.hasAttribute('data-disabled');
    
    items.forEach(item => {
      const itemValue = item.getAttribute('data-value');
      const isSelected = itemValue === currentValue;
      const isItemDisabled = item.hasAttribute('data-disabled');
      const isDisabled = isItemDisabled || isRootDisabled;

      item.setAttribute('aria-checked', isSelected.toString());
      item.setAttribute('tabindex', (isSelected && !isDisabled) ? '0' : '-1');
      item.setAttribute('data-state', isSelected ? 'checked' : 'unchecked');
      
      if (isRootDisabled) {
        item.setAttribute('disabled', 'disabled');
      } else if (!isItemDisabled) {
        item.removeAttribute('disabled');
      }
      
      const indicator = item.querySelector('[data-essence-radio-group-indicator]');
      if (indicator) {
        indicator.style.display = isSelected ? 'inline-flex' : 'none';
        indicator.setAttribute('data-state', isSelected ? 'checked' : 'unchecked');
      }

      if (!item.hasAttribute('data-has-click')) {
        item.addEventListener('click', this.onItemClick);
        item.setAttribute('data-has-click', 'true');
      }
    });

    // Handle form input if present
    const name = this.el.getAttribute('data-name');
    if (name) {
      let input = this.el.querySelector(`input[type="hidden"][name="${name}"]`);
      if (!input) {
        input = document.createElement('input');
        input.type = 'hidden';
        input.name = name;
        this.el.appendChild(input);
      }
      if (input.value !== currentValue) {
        input.value = currentValue || "";
        input.dispatchEvent(new Event('change', { bubbles: true }));
      }
    }
  },

  onItemClick(e) {
    const item = e.currentTarget;
    const isRootDisabled = this.el.hasAttribute('data-disabled');
    const isItemDisabled = item.hasAttribute('data-disabled');
    if (isItemDisabled || isRootDisabled) return;

    const value = item.getAttribute('data-value');
    this.selectValue(value);
  },

  selectValue(value) {
    if (this.el.getAttribute('data-value') === value) return;

    this.el.setAttribute('data-value', value);
    this.syncValue();

    const onValueChange = this.el.getAttribute('data-on-value-change');
    if (onValueChange) {
      this.pushEvent(onValueChange, { value: value });
    }
  },

  onKeyDown(e) {
    if (this.el.hasAttribute('data-disabled')) return;

    const items = Array.from(this.el.querySelectorAll('[data-essence-radio-group-item]'));
    const enabledItems = items.filter(item => {
        const isDisabled = item.hasAttribute('data-disabled') || item.hasAttribute('disabled');
        return !isDisabled;
    });
    if (enabledItems.length === 0) return;

    const currentIndex = enabledItems.indexOf(document.activeElement);
    const isHorizontal = this.el.getAttribute('data-orientation') === 'horizontal';
    const loop = this.el.getAttribute('data-loop') !== 'false';

    let nextIndex = -1;
    switch (e.key) {
      case 'ArrowDown':
      case 'ArrowRight':
        if (isHorizontal && e.key === 'ArrowDown') return;
        if (!isHorizontal && e.key === 'ArrowRight') return;
        e.preventDefault();
        nextIndex = currentIndex + 1;
        if (nextIndex >= enabledItems.length) nextIndex = loop ? 0 : enabledItems.length - 1;
        break;
      case 'ArrowUp':
      case 'ArrowLeft':
        if (isHorizontal && e.key === 'ArrowUp') return;
        if (!isHorizontal && e.key === 'ArrowLeft') return;
        e.preventDefault();
        nextIndex = currentIndex - 1;
        if (nextIndex < 0) nextIndex = loop ? enabledItems.length - 1 : 0;
        break;
      case 'Home':
        e.preventDefault();
        nextIndex = 0;
        break;
      case 'End':
        e.preventDefault();
        nextIndex = enabledItems.length - 1;
        break;
      case ' ':
      case 'Enter':
        // If not already focused, we might need to handle click-like behavior
        // But role="radio" items usually handle click on their own.
        break;
      default:
        return;
    }

    if (nextIndex !== -1) {
      const nextItem = enabledItems[nextIndex];
      nextItem.focus();
      this.selectValue(nextItem.getAttribute('data-value'));
    }
  },

  destroyed() {
    this.el.removeEventListener('keydown', this.onKeyDown);
  }
};
