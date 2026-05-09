export const ScrollArea = {
  mounted() {
    this.viewport = this.el.querySelector('.rt-ScrollAreaViewport');
    this.verticalScrollbar = this.el.querySelector('.rt-ScrollAreaScrollbar[data-orientation="vertical"]');
    this.horizontalScrollbar = this.el.querySelector('.rt-ScrollAreaScrollbar[data-orientation="horizontal"]');
    this.verticalThumb = this.verticalScrollbar.querySelector('.rt-ScrollAreaThumb');
    this.horizontalThumb = this.horizontalScrollbar.querySelector('.rt-ScrollAreaThumb');
    this.type = this.el.dataset.type || 'hover';
    this.hideDelay = parseInt(this.el.dataset.scrollHideDelay || '600');

    this.onScroll = this.onScroll.bind(this);
    this.updateScrollbars = this.updateScrollbars.bind(this);
    this.hideScrollbars = this.hideScrollbars.bind(this);
    this.showScrollbars = this.showScrollbars.bind(this);

    this.viewport.addEventListener('scroll', this.onScroll);
    window.addEventListener('resize', this.updateScrollbars);

    this.updateScrollbars();

    if (this.type === 'hover') {
      this.el.addEventListener('mouseenter', this.showScrollbars);
      this.el.addEventListener('mouseleave', this.hideScrollbars);
      this.verticalScrollbar.dataset.state = 'hidden';
      this.horizontalScrollbar.dataset.state = 'hidden';
    } else if (this.type === 'scroll') {
      this.verticalScrollbar.dataset.state = 'hidden';
      this.horizontalScrollbar.dataset.state = 'hidden';
    } else if (this.type === 'always') {
      this.verticalScrollbar.dataset.state = 'visible';
      this.horizontalScrollbar.dataset.state = 'visible';
    }

    // Mutation observer to update scrollbars when content changes
    this.observer = new MutationObserver(this.updateScrollbars);
    this.observer.observe(this.viewport, { childList: true, subtree: true, characterData: true });
  },

  onScroll() {
    this.updateThumbPositions();
    if (this.type === 'scroll') {
      this.showScrollbars();
      clearTimeout(this.hideTimeout);
      this.hideTimeout = setTimeout(this.hideScrollbars, this.hideDelay);
    }
  },

  showScrollbars() {
    this.verticalScrollbar.dataset.state = 'visible';
    this.horizontalScrollbar.dataset.state = 'visible';
  },

  hideScrollbars() {
    if (this.type === 'always' || this.isDragging) return;
    this.verticalScrollbar.dataset.state = 'hidden';
    this.horizontalScrollbar.dataset.state = 'hidden';
  },

  updateScrollbars() {
    const { offsetHeight, scrollHeight, offsetWidth, scrollWidth } = this.viewport;

    const hasVerticalScroll = scrollHeight > offsetHeight;
    const hasHorizontalScroll = scrollWidth > offsetWidth;

    this.verticalScrollbar.style.display = hasVerticalScroll ? 'flex' : 'none';
    this.horizontalScrollbar.style.display = hasHorizontalScroll ? 'flex' : 'none';

    if (hasVerticalScroll) {
      const thumbHeight = Math.max((offsetHeight / scrollHeight) * offsetHeight, 20);
      this.verticalThumb.style.height = `${thumbHeight}px`;
    }

    if (hasHorizontalScroll) {
      const thumbWidth = Math.max((offsetWidth / scrollWidth) * offsetWidth, 20);
      this.horizontalThumb.style.width = `${thumbWidth}px`;
    }

    this.updateThumbPositions();
  },

  updateThumbPositions() {
    const { scrollTop, scrollHeight, offsetHeight, scrollLeft, scrollWidth, offsetWidth } = this.viewport;

    if (scrollHeight > offsetHeight) {
      const maxScrollTop = scrollHeight - offsetHeight;
      const maxThumbTop = offsetHeight - this.verticalThumb.offsetHeight;
      const thumbTop = (scrollTop / maxScrollTop) * maxThumbTop;
      this.verticalThumb.style.transform = `translateY(${thumbTop}px)`;
    }

    if (scrollWidth > offsetWidth) {
      const maxScrollLeft = scrollWidth - offsetWidth;
      const maxThumbLeft = offsetWidth - this.horizontalThumb.offsetWidth;
      const thumbLeft = (scrollLeft / maxScrollLeft) * maxThumbLeft;
      this.horizontalThumb.style.transform = `translateX(${thumbLeft}px)`;
    }
  },

  destroyed() {
    this.viewport.removeEventListener('scroll', this.onScroll);
    window.removeEventListener('resize', this.updateScrollbars);
    this.observer.disconnect();
    clearTimeout(this.hideTimeout);
  }
};
