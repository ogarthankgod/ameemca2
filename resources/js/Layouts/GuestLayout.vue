<script setup>
// import ApplicationLogo from "@/Components/ApplicationLogo.vue";
import AmeemcaLogo from "@/Components/LogoIcon.vue"
import { Link } from "@inertiajs/vue3";
</script>

<template>
    <div
        class="min-h-screen flex flex-col items-center pt-6 sm:pt-0 justify-center"
    >
        <div class="m-3 mt-10 h-fit w-fit !flex-grow-0">
            <Link href="/">
                <AmeemcaLogo class="w-20 h-20 fill-current text-gray-500" />
            </Link>
        </div>

        <div
            class="w-full sm:max-w-md mt-6 px-6 py-10 bg-white shadow-md overflow-hidden sm:rounded-lg !flex-grow-0"
        >
            <slot />
        </div>
    </div>
</template>
