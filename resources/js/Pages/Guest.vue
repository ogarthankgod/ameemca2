<script setup>
import { Head, Link } from "@inertiajs/vue3";
import Logo from "@/Components/Logo.vue";
// import Guest from "./Guest/Guests.vue"


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
    <Logo/>
    <h1>Hello World</h1>
</template>
