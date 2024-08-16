<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import { Head, Link } from "@inertiajs/vue3";
import { FaCheckCircle } from "oh-vue-icons/icons";
import { addIcons } from "oh-vue-icons";

addIcons(FaCheckCircle);

defineOptions({
  layout: AuthenticatedLayout,
});
</script>

<template>
  <Head title="Our Objectives" />
  <SectionHead text="Our Objectives" />

  <section class="mt-3 bg-white shadow-md p-3 rounded-lg">
    <div class="text-sm">
      <p class="text">
        <v-icon name="fa-check-circle"></v-icon> The principal objective of the society is
        to promote the interests of all its members to improve their socio-economic
        well-being through savings and investments in accordance with the principles of
        the cooperative.
      </p>
      <p class="text mt-3">
        <v-icon name="fa-check-circle"></v-icon> To provide credit facilities to its
        members at fair and reasonable rates of interest for provident and productive
        purposes.
      </p>

      <p class="text mt-3">
        <v-icon name="fa-check-circle"></v-icon> To encourage the culture of savings and
        investments of AMEEMCA members through bi-weekly allotment
      </p>
      <p class="text mt-3">
        <v-icon name="fa-check-circle"></v-icon> To engage in any other economic or social
        activity as may be approved by the general meeting of members.
      </p>
      <p class="text mt-3">
        <v-icon name="fa-check-circle"></v-icon> To carefully manage financial portfolios
        by investing in rewarding ventures and be guided by the decision of members
        approved by the General House. In this way, the society shall become part owners
        of well-established and sustainable investments.
      </p>
      <p class="text mt-3">
        <v-icon name="fa-check-circle"></v-icon> To support and encourage members on real
        estate options for the benefit of members.
      </p>
      <p class="text mt-3">
        <v-icon name="fa-check-circle"></v-icon> To take measures that would promote among
        the members, the spirit of thrift, mutual-help, self-help, and investments.
      </p>
      <p class="text mt-3">
        <v-icon name="fa-check-circle"></v-icon> To partner with other corporate entities
        for sourcing of funds, investments or other financial activities for the purpose
        of assisting members to achieve their financial goals.
      </p>
    </div>
  </section>
</template>
