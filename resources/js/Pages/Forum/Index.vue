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
  <div>
    <span id="ProgressLabel" class="sr-only">Loading</span>

    <span
      role="progressbar"
      aria-labelledby="ProgressLabel"
      aria-valuenow="75"
      class="block rounded-full bg-gray-200"
    >
      <span
        class="block h-3 rounded-full bg-[repeating-linear-gradient(45deg,_var(--tw-gradient-from)_0,_var(--tw-gradient-from)_20px,_var(--tw-gradient-to)_20px,_var(--tw-gradient-to)_40px)] from-indigo-400 to-indigo-500"
        style="width: 75%"
      ></span>
    </span>
  </div>
  <!-- AsuniiaLeVrai#4610 -->
  <div class="m-5">
    <h1 class="text-gray-500 font-bold text-1xl tracking-wide">Posts</h1>
  </div>

  <div class="justify-between grid grid-cols m-5 mb-5">
    <!-- START Card component -->
    <Link class="container bg-white shadow-xl rounded-lg p-5" href="#">
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
    </Link>
    <!-- END Card component -->
  </div>

  <div class="grid grid-cols-1 mb-7 opacity-50">
    <div
      class="flex items-center p-4 mb-4 text-sm text-red-800 border border-red-300 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400 dark:border-red-800"
      role="alert"
    >
      <svg
        class="flex-shrink-0 inline w-4 h-4 me-3"
        aria-hidden="true"
        xmlns="http://www.w3.org/2000/svg"
        fill="currentColor"
        viewBox="0 0 20 20"
      >
        <path
          d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"
        />
      </svg>
      <span class="sr-only">Info</span>
      <div><span class="font-medium">!!</span> Background Jobs is still Compiling.</div>
    </div>
  </div>
</template>
