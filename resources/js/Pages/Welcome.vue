<script setup>
import { Head, Link } from "@inertiajs/vue3";
import Logo from "@/Components/Logo.vue";

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
});
</script>

<template>
    <Head title="Welcome" />
    <div class="text-black/50 bg-gray-50 min-h-screen" v-if="false">
        <div
            class="relative flex flex-col items-center justify-center selection:bg-[#2079ff] selection:text-white"
        >
            <div class="relative w-full max-w-2xl px-6 lg:max-w-7xl">
                <header
                    class="grid grid-cols-2 items-center gap-2 py-10 lg:grid-cols"
                >
                    <div class="flex col-start-1 items-center">
                        <Logo />
                        <p class="mx-2">AMEEMCA</p>
                    </div>

                    <nav
                        v-if="canLogin"
                        class="-mx-3 flex flex-1 justify-end text-black"
                    >
                        <Link
                            v-if="$page.props.auth.user"
                            :href="route('dashboard')"
                            class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white"
                        >
                            Dashboard
                        </Link>

                        <template v-else>
                            <Link
                                :href="route('login')"
                                class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20]"
                            >
                                Log in
                            </Link>

                            <Link
                                v-if="canRegister"
                                :href="route('register')"
                                class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] mr-2"
                            >
                                Register
                            </Link>
                        </template>
                    </nav>
                </header>

                <main class="mt-6">
                    <p>Hello Ameemca!</p>
                </main>

                <footer class="py-16 text-center text-sm text-black">
                    Haha bruh
                </footer>
            </div>
        </div>
    </div>

    <header class="text-gray-600 body-font mt-4">
        <div
            class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center justify-between"
        >
            <a
                class="flex title-font font-medium items-center text-gray-900 mb-0 md:mb-0"
            >
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    class="w-10 h-10 text-white p-2 bg-red-500 rounded-full"
                    viewBox="0 0 24 24"
                >
                    <path
                        d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"
                    ></path>
                </svg>
                <span class="ml-3 text-xl">Tailblocks</span>
            </a>

            <nav
                class="md:ml-auto flex flex-wrap items-center text-base justify-center"
            >
                <a class="mr-5 hover:text-gray-900">First Link</a>
                <a class="mr-5 hover:text-gray-900">Second Link</a>
                <a class="mr-5 hover:text-gray-900">Third Link</a>
                <a class="mr-5 hover:text-gray-900">Fourth Link</a>

                <button
                class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-0 md:mt-0"
            >
                Button
                <svg
                    fill="none"
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    class="w-4 h-4 ml-1"
                    viewBox="0 0 24 24"
                >
                    <path d="M5 12h14M12 5l7 7-7 7"></path>
                </svg>
            </button>
            </nav>
            
        </div>
    </header>
</template>
