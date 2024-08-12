<script setup>
defineProps({
  text: String
});

</script>

<template>
    <header>
        <div class="max-w-7xl mx-auto mt-4 :sm:px-6 :lg:px-8 mb-3 font-bold text-gray-800">
          {{ text ? text : "No Heading" }}
        </div>
    </header>
</template>
