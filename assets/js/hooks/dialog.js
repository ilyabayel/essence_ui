/**
 * Dialog Hooks for Essence UI
 * 
 * Implements client-side behavior for Dialog primitive component,
 * providing focus management, keyboard navigation, and accessibility features.
 */

export const Dialog = {
    mounted() {
        this.el.setAttribute("data-state", this.el.getAttribute("data-default-state"));
        this.el.addEventListener("open", this.open.bind(this));
        this.el.addEventListener("close", this.close.bind(this));
    },
    close(e) {
        e.stopPropagation();
        this.el.setAttribute("data-state", "close");
    },
    open(e) {
        e.stopPropagation();
        this.el.setAttribute("data-state", "open");
    }
}