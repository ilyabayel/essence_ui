/**
 * RadioCards Hook
 * 
 * Handles client-side interactions for radio card items.
 * Selecting a radio card deselects all others in the group.
 */
export const RadioCards = {
    mounted() {
        this.handleCardClick = this.handleCardClick.bind(this);

        // Initialize state based on data-default-value from root
        const defaultValue = this.el.getAttribute('data-default-value');
        if (defaultValue) {
            this.el.querySelectorAll('.rt-RadioCardsItem').forEach(card => {
                if (card.getAttribute('value') === defaultValue) {
                    card.setAttribute('data-state', 'checked');
                    card.setAttribute('aria-checked', 'true');
                } else {
                    card.setAttribute('data-state', 'unchecked');
                    card.setAttribute('aria-checked', 'false');
                }
            });
        }

        // Add click handlers to all card items
        this.el.querySelectorAll('.rt-RadioCardsItem').forEach(card => {
            card.addEventListener('click', this.handleCardClick);
        });
    },

    handleCardClick(event) {
        const clickedCard = event.currentTarget;
        
        if (clickedCard.disabled) {
            return;
        }

        // Uncheck all items in this radio cards group
        this.el.querySelectorAll('.rt-RadioCardsItem').forEach(card => {
            card.setAttribute('data-state', 'unchecked');
            card.setAttribute('aria-checked', 'false');
        });

        // Check the clicked item
        clickedCard.setAttribute('data-state', 'checked');
        clickedCard.setAttribute('aria-checked', 'true');
    },

    destroyed() {
        // Cleanup event listeners
        this.el.querySelectorAll('.rt-RadioCardsItem').forEach(card => {
            card.removeEventListener('click', this.handleCardClick);
        });
    }
};
