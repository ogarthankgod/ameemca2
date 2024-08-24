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
  <Head title="Investments" />
  <SectionHead text="Investments Dashboard" />

  <div class="bg-white rounded-md p-5 mb-5">Welcome, {{ user.firstname }} ..<br /></div>

  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-7">
    <!-- Balance Card -->
    <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
      <div class="bg-yellow-100 p-3 rounded-full">
        <v-icon name="gi-take-my-money" class="flex-shrink-0 w-5 h-5 text-yellow-500" />
        <!-- <i class="fas fa-wallet text-yellow-500"></i> -->
      </div>
      <div>
        <p class="text-sm text-gray-500">Returns</p>
        <p class="text-sm font-bold">₦ 0.00</p>
      </div>
    </div>

    <!-- Total Saving Card -->
    <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
      <div class="bg-teal-100 p-3 rounded-full">
        <v-icon name="gi-swap-bag" class="flex-shrink-0 w-5 h-5 text-teal-500" />
        <i class="fas fa-piggy-bank text-teal-500"></i>
      </div>
      <div>
        <p class="text-sm text-gray-500">Contribution Balance</p>
        <p class="text-sm font-bold">₦ {{ contributionBalance }}</p>
      </div>
    </div>
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
      <div><span class="font-medium">!!</span> Background Jobs are still Compiling.</div>
    </div>
  </div>
</template>
