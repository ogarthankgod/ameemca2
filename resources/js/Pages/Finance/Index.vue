<script setup>
import { Head, Link } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";

defineOptions({
  layout: AuthenticatedLayout,
});
</script>

<template>
  <Head title="Wallet Dashboard" />
  <SectionHead text="Wallet" />
</template>
