/**
 * CheckboxCards Hook
 * 
 * Handles client-side interactions for checkbox card items.
 * Toggles checkbox state when clicking on the card label.
 */
export const CheckboxCards = {
    mounted() {
        this.handleCardClick = this.handleCardClick.bind(this);

        // Add click handlers to all card items
        this.el.querySelectorAll('.rt-CheckboxCardsItem').forEach(card => {
            card.addEventListener('click', this.handleCardClick);
        });
    },

    handleCardClick(event) {
        const card = event.currentTarget;
        const checkbox = card.querySelector('.rt-CheckboxCardCheckbox');

        if (!checkbox || checkbox.disabled) {
            return;
        }

        // Toggle checkbox state
        const currentState = checkbox.getAttribute('data-state');
        const newState = currentState === 'checked' ? 'unchecked' : 'checked';

        checkbox.setAttribute('data-state', newState);
        checkbox.setAttribute('aria-checked', newState === 'checked' ? 'true' : 'false');

        // Add or remove checkmark SVG
        if (newState === 'checked') {
            checkbox.innerHTML = `
        <svg
          width="9"
          height="9"
          viewBox="0 0 9 9"
          fill="currentcolor"
          xmlns="http://www.w3.org/2000/svg"
          data-state="checked"
          class="rt-BaseCheckboxIndicator"
          style="pointer-events: none;"
        >
          <path
            fill-rule="evenodd"
            clip-rule="evenodd"
            d="M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z"
          />
        </svg>
      `;
        } else {
            checkbox.innerHTML = '';
        }
    },

    destroyed() {
        // Cleanup event listeners
        this.el.querySelectorAll('.rt-CheckboxCardsItem').forEach(card => {
            card.removeEventListener('click', this.handleCardClick);
        });
    }
};
