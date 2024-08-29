// Uncomment to add Bootstrap
// import './bootstrap';

//Import tailwind css and fonts too
import "../css/app.css";

import { createApp, h } from "vue";
import { createInertiaApp } from "@inertiajs/vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";
import { ZiggyVue } from "../../vendor/tightenco/ziggy";
import { createVuestic } from "vuestic-ui";
import 'flowbite';

// import { createPinia } from 'pinia';

//Importing FlowBite Components
// import { onMounted } from "vue";
// import { initFlowbite } from "flowbite";

//Use only without tailwind
// import "vuestic-ui/css";

//Use with Tailwind CSS only
import "vuestic-ui/styles/essential.css";
import "vuestic-ui/styles/typography.css";

//import oh-vue-icon
import { OhVueIcon } from "oh-vue-icons";

const appName = import.meta.env.VITE_APP_NAME || "Ameemca Portal";
// const pinia = createPinia()

// // initialize components based on data attribute selectors
// onMounted(() => {
    // initFlowbite();
// });

createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) =>
        resolvePageComponent(
            `./Pages/${name}.vue`,
            import.meta.glob("./Pages/**/*.vue")
        ),
    setup({ el, App, props, plugin }) {
        return (
            createApp({ render: () => h(App, props) })
                .use(createVuestic())
                // .use(pinia)
                .use(plugin)
                .use(ZiggyVue)
                .component("v-icon", OhVueIcon)
                .mount(el)
        );
    },
    progress: {
        color: "#4B5563",
    },
});
