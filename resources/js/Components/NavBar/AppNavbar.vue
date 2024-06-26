<template>
    <header class="text-gray-600 body-font bg-white">
        <div class="mx-auto flex flex-wrap p-5 flex-row items-center">
            <VaIconMenuCollapsed
                class="cursor-pointer"
                :class="{ 'x-flip': !isSidebarMinimized }"
                :color="collapseIconColor"
                @click="isSidebarMinimized = !isSidebarMinimized"
                v-show="!isMobile"
            />
            <Link
                href="/"
                aria-label="Home page"
                class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0 ml-3"
            >
                <!-- <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    class="w-10 h-10 text-white p-2 bg-red-500 rounded-full pr-2"
                    viewBox="0 0 24 24"
                >
                    <path
                        d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"
                    ></path>
                </svg> -->
                <VuesticLogo /> 
                <!-- <span class="ml-3 text-xl">AMEEMCA</span> -->
            </Link>

            <nav
                class="mr-auto ml-4 py-1 pl-4 border-l border-red-400 items-center text-base justify-center hidden md:flex text-gray-900"
            >
                <a class="mr-5 hover:text-gray-500 border-b border-red-500 pb-1 cursor-pointer">First Link</a>
                <a class="mr-5 hover:text-gray-500 cursor-pointer border-b border-transparent pb-1 hover:border-red-500">Second Link</a>
                <a class="mr-5 hover:text-gray-500 cursor-pointer border-b border-transparent pb-1 hover:border-red-500">Third Link</a>
                <a class="mr-5 hover:text-gray-500 cursor-pointer border-b border-transparent pb-1 hover:border-red-500">Fourth Link</a>
            </nav>

            <AppNavbarActions
                class="app-navbar__actions"
                :is-mobile="isMobile"
            />

            <Transition v-if="isMobile" name="icon-fade" mode="out-in">
                <VaIcon
                    color="primary"
                    :name="isSidebarMinimized ? 'menu' : 'close'"
                    size="24px"
                    style="margin-top: 3px"
                    @click="isSidebarMinimized = !isSidebarMinimized"
                />
            </Transition>
        </div>
    </header>
</template>

<script setup>
import { computed } from "vue";
import { Link } from "@inertiajs/vue3";
import { storeToRefs } from "pinia";
import AppNavbarActions from "./components/AppNavbarActions.vue";
import VaIconMenuCollapsed from "../icons/VaIconMenuCollapsed.vue";
// import VuesticLogo from "@/Components/Logo.vue";
import VuesticLogo from "@/Components/Logo.vue";
import { defineStore } from "pinia";
import { useColors } from "vuestic-ui";

const useGlobalStore = defineStore("global", {
    state: () => {
        return {
            isSidebarMinimized: false,
        };
    },

    actions: {
        toggleSidebar() {
            this.isSidebarMinimized = !this.isSidebarMinimized;
        },
    },
});

defineProps({
    isMobile: { type: Boolean, default: false },
});

const GlobalStore = useGlobalStore();

const { isSidebarMinimized } = storeToRefs(GlobalStore);
const { getColor } = useColors();
const collapseIconColor = computed(() => getColor("secondary"));
</script>

<style lang="scss" scoped>
.va-navbar {
    z-index: 2;

    @media screen and (max-width: 950px) {
        .left {
            width: 100%;
        }

        .app-navbar__actions {
            display: flex;
            justify-content: space-between;
        }
    }
}

.left {
    display: flex;
    align-items: center;
    margin-left: 1rem;

    & > * {
        margin-right: 1rem;
    }

    & > *:last-child {
        margin-right: 0;
    }
}

.icon-fade-enter-active,
.icon-fade-leave-active {
    transition: transform 0.5s ease;
}

.icon-fade-enter,
.icon-fade-leave-to {
    transform: scale(0.5);
}
</style>
