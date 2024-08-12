<script setup>
import { Link } from "@inertiajs/vue3";
import { ref } from "vue";
import ApplicationLogo from "@/Components/Logo.vue";
import Dropdown from "@/Components/Dropdown.vue";
import DropdownLink from "@/Components/DropdownLink.vue";
import NavLink from "@/Components/NavLink.vue";
import ResponsiveNavLink from "@/Components/ResponsiveNavLink.vue";
import SideBar from "@/Components/SideBar/SideBar.vue";
// import SectionHead from "./SectionHead.vue";

//Importing FlowBite Components
import { onMounted } from "vue";
import { initFlowbite } from "flowbite";

const props = defineProps({
    name: String,
    fullname: String,
});

// initialize components based on data attribute selectors
onMounted(() => {
    initFlowbite();
});
</script>

<template>
    <div class="max-w-7xl mx-auto min-h-screen">
        <div class="h-16 mb-2">
            <nav
                class="max-w-7xl fixed top-0 z-50 bg-white border-b border-gray-200 dark:bg-gray-800 dark:border-gray-700 w-full"
                style=""
            >
                <div class="px-3 py-3 lg:px-5 lg:pl-3">
                    <div class="flex items-center justify-between">
                        <div
                            class="flex items-center justify-start rtl:justify-end"
                        >
                            <button
                                data-drawer-target="logo-sidebar"
                                data-drawer-toggle="logo-sidebar"
                                aria-controls="logo-sidebar"
                                type="button"
                                class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                            >
                                <span class="sr-only">Open sidebar</span>
                                <svg
                                    class="w-6 h-6"
                                    aria-hidden="true"
                                    fill="currentColor"
                                    viewBox="0 0 20 20"
                                    xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                        clip-rule="evenodd"
                                        fill-rule="evenodd"
                                        d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"
                                    ></path>
                                </svg>
                            </button>
                            <Link href="#" class="flex ms-2 md:me-24">
                                <ApplicationLogo
                                    class="block h-12 w-auto fill-current text-gray-800"
                                />
                                <span
                                    class="hidden self-center text-xl font-semibold sm:text-2xl whitespace-nowrap dark:text-white"
                                    >AMEEMCA</span
                                >
                            </Link>
                        </div>

                        <div class="flex items-center justify-end">
                            <div class="flex items-center">
                                <div>
                                    <button
                                        type="button"
                                        class="hidden sm:flex text-sm bg-gray-800 rounded-full focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600"
                                        aria-expanded="false"
                                        data-dropdown-toggle="dropdown-user"
                                    >
                                        <span class="sr-only"
                                            >Open user menu</span
                                        >
                                        <img
                                            class="w-8 h-8 rounded-full"
                                            v-if="$page.props.auth.photo"
                                            :src="$page.props.auth.photo"
                                            alt="user photo"
                                        />
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            viewBox="0 0 1024 1024"
                                            class="w-8 h-8 rounded-full text-white bg-white"
                                            v-else
                                        >
                                            <path
                                                fill="#000000"
                                                d="M628.736 528.896A416 416 0 0 1 928 928H96a415.872 415.872 0 0 1 299.264-399.104L512 704l116.736-175.104zM720 304a208 208 0 1 1-416 0 208 208 0 0 1 416 0z"
                                            />
                                        </svg>
                                    </button>
                                </div>

                                <div
                                    class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded shadow dark:bg-gray-700 dark:divide-gray-600"
                                    id="dropdown-user"
                                >
                                    <div class="px-4 py-3" role="none">
                                        <p
                                            class="text-sm text-gray-900 dark:text-white"
                                            role="none"
                                        >
                                            {{ $page.props.auth.user.fullname }}
                                        </p>
                                        <p
                                            class="text-sm font-medium text-gray-900 truncate dark:text-gray-300"
                                            role="none"
                                        >
                                            ...
                                        </p>
                                    </div>
                                    <ul class="py-1" role="none">
                                        <li>
                                            <a
                                                href="#"
                                                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem"
                                                >Dashboard</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                href="#"
                                                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem"
                                                >Settings</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                href="#"
                                                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem"
                                                >Earnings</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                href="#"
                                                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-600 dark:hover:text-white"
                                                role="menuitem"
                                                >Sign out</a
                                            >
                                        </li>
                                    </ul>
                                </div>

                                <div class="flex items-center">
                                    <!-- Settings Dropdown -->
                                    <div class="ms-3 relative">
                                        <Dropdown align="right" width="48">
                                            <template #trigger>
                                                <span
                                                    class="inline-flex rounded-md"
                                                >
                                                    <button
                                                        type="button"
                                                        class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150"
                                                    >
                                                        <span
                                                            class="hidden sm:flex"
                                                        >
                                                            {{
                                                                $page.props.auth
                                                                    .user.name
                                                            }}
                                                        </span>

                                                        <svg
                                                            class="ms-2 -me-0.5 h-4 w-4"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            viewBox="0 0 20 20"
                                                            fill="currentColor"
                                                        >
                                                            <path
                                                                fill-rule="evenodd"
                                                                d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                                                clip-rule="evenodd"
                                                            />
                                                        </svg>
                                                    </button>
                                                </span>
                                            </template>

                                            <template #content>
                                                <DropdownLink
                                                    :href="
                                                        route('profile.edit')
                                                    "
                                                >
                                                    Edit Profile
                                                </DropdownLink>
                                                <DropdownLink
                                                    :href="route('logout')"
                                                    method="post"
                                                    as="button"
                                                >
                                                    Log Out
                                                </DropdownLink>
                                            </template>
                                        </Dropdown>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>

        <!-- Page Content -->
        <main class="flex">
            <SideBar />
            <section class="max-w-screen-xl w-full mx-auto px-3 sm:px-[3rem]">
                <!-- Page Heading -->
                <!-- <SectionHead text=""/> -->
                <slot />
            </section>
        </main>
    </div>
</template>
