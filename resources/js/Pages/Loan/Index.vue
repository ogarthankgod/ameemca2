<script setup>
import { Head, Link } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";

defineProps({
  pageState: String,
});

defineOptions({
  layout: AuthenticatedLayout,
});
</script>

<template>
  <Head title="Loan Portal" />
  <SectionHead text="Loan Dashboard" />

  <div class="bg-white rounded-md p-5 mb-5">Viewing State:, {{ pageState }} ..<br /></div>
</template>
