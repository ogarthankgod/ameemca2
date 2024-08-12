<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import { Head, Link } from "@inertiajs/vue3";

defineOptions({
    layout: AuthenticatedLayout,
});
</script>

<template>
    <Head title="Video Conference" />
    <SectionHead text="Video Conference" />
</template>
