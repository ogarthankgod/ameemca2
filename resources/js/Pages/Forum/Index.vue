<script setup>
import { Head, Link, usePage } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import initFlowBite from "@/Components/initFlowBite.vue";

import {
  GiReceiveMoney,
  GiTakeMyMoney,
  GiMoneyStack,
  GiSwapBag,
  IoCashOutline,
  GiPiggyBank,
  RiMastercardFill,
  FcSimCardChip,
} from "oh-vue-icons/icons";
import { addIcons } from "oh-vue-icons";

addIcons(
  GiReceiveMoney,
  GiTakeMyMoney,
  GiMoneyStack,
  GiSwapBag,
  IoCashOutline,
  GiPiggyBank,
  RiMastercardFill,
  FcSimCardChip
);

// import bb, { area, areaSpline, areaLineRange, areaSplineRange } from "billboard.js";
// import "billboard.js/dist/billboard.css";

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  greeting: String,
  time: String,
  accountBalance: String,
  income: String,
  loanBalance: String,
  contributionBalance: String,
});

const user = usePage().props.auth.user;
</script>

<template>
  <Head title="Forums" />
  <SectionHead text="Forums" />
  <!-- AsuniiaLeVrai#4610 -->
  <div class="m-5">
    <h1 class="text-gray-500 font-bold text-1xl tracking-wide">Posts</h1>
  </div>

  <div class="flex justify-between grid grid-cols-3 gap-6 m-5 mb-5">
    <!-- START Card component -->
    <div class="container bg-white shadow-xl rounded-lg p-5">
      <h1 class="font-bold text-yellow-500">AMEEMCA Package types and their Benefits</h1>
      <p class="font-light text-gray-500 text-sm">
        AMEEMCA Packages and their benefits. packages are a gateway to define and shape
        your experience on AMEEMCA...
      </p>
      <h6 class="text-sm text-gray-400 mb-5 tet-sm">24/08/2024</h6>
      <a
        href="#"
        class="rounded-lg py-2 px-4 text-center text-white bg-yellow-400 hover:bg-yellow-500"
        >Read More</a
      >
    </div>
    <!-- END Card component -->
  </div>
</template>
