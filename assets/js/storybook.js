// Import hooks for Essence UI components
import { Dialog } from "./hooks/dialog";
import { Tabs } from "./hooks/tabs";
import { CheckboxCards } from "./hooks/checkbox_cards";
import { RadioCards } from "./hooks/radio_cards";

// Hooks object for storybook
const Hooks = {
    Dialog,
    Tabs,
    CheckboxCards,
    RadioCards
};

(function () {
    window.storybook = { Hooks };
})();


// If your components require alpinejs, you'll need to start
// alpine after the DOM is loaded and pass in an onBeforeElUpdated
// 
// import Alpine from 'alpinejs'
// window.Alpine = Alpine
// document.addEventListener('DOMContentLoaded', () => {
//   window.Alpine.start();
// });

// (function () {
//   window.storybook = {
//     LiveSocketOptions: {
//       dom: {
//         onBeforeElUpdated(from, to) {
//           if (from._x_dataStack) {
//             window.Alpine.clone(from, to)
//           }
//         }
//       }
//     }
//   };
// })();
