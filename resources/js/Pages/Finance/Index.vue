<script setup>
import { Head, Link, usePage } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";

import bb, { area, areaSpline, areaLineRange, areaSplineRange } from "billboard.js";
import "billboard.js/dist/billboard.css";

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  greeting: String,
  time: String,
});

const user = usePage().props.auth.user;

// for ESM environment, need to import modules as:
// import bb, {area, areaSpline} from "billboard.js";

var chart = bb.generate({
  bindto: "#chart",

  data: {
    columns: [
      ["data1", 300, 350, 300, 0, 0, 0],
      ["data2", 130, 100, 140, 200, 150, 50],
    ],
    types: {
      data1: area(), // for ESM specify as: area()
      data2: areaSpline(), // for ESM specify as: areaSpline()
    },
  },
});
chart.data("data1");
// var chart = bb.generate({
//   data: {
//     x: "x",
//     columns: [
//       [
//         "x",
//         "2024-01-01",
//         "2024-01-02",
//         "2024-01-03",
//         "2024-01-04",
//         "2024-01-05",
//         "2024-01-06",
//       ],
//       [
//         "Transactions",
//         [15000, 14000, 11000],
//         [15500, 13000, 11500],
//         [16000, 13500, 12000],
//         [13500, 12000, 11000],
//         [18000, 15000, 13000],
//         [19900, 16000, 12500],
//       ],
//       ["Contributions", 13000, 34000, 20000, 50000, 25000, 35000],
//     ],
//     types: {
//       Transactions: areaLineRange(),
//     },
//   },
//   axis: {
//     x: {
//       type: "timeseries",
//       tick: {
//         format: "%Y-%m-%d",
//       },
//     },
//   },
//   bindto: "#areaRangeChart",
// });

// setTimeout(function () {
//   chart.load({
//     columns: [
//       [
//         "data3",
//         [220, 215, 205],
//         [240, 225, 215],
//         [260, 235, 225],
//         [280, 245, 235],
//         [270, 255, 225],
//         [240, 225, 215],
//       ],
//     ],
//     types: {
//       data3: areaSplineRange(), // for ESM specify as: areaSplineRange()
//     },
//   });
// }, 1000);

// setTimeout(function () {
//   chart.load({
//     columns: [
//       [
//         "data4",
//         { high: 155, low: 145, mid: 150 },
//         { high: 200, mid: 190, low: 150 },
//         { high: 230, mid: 215, low: 200 },
//         { high: 210, mid: 200, low: 180 },
//         { high: 220, mid: 210, low: 190 },
//         { high: 200, mid: 180, low: 160 },
//       ],
//     ],
//     types: {
//       data4: areaSplineRange(), // for ESM specify as: areaSplineRange()
//     },
//   });
// }, 1500);
</script>

<template>
  <Head title="Wallet Dashboard" />
  <SectionHead text="Wallet" />

  <div class="bg-white rounded-md p-5 mb-5">
    {{ greeting }}, {{ user.firstname }} ..<br />
  </div>

  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-7">
    <!-- Balance Card -->
    <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
      <div class="bg-yellow-100 p-3 rounded-full">
        <v-icon name="gi-take-my-money" class="flex-shrink-0 w-5 h-5 text-yellow-500" />
        <!-- <i class="fas fa-wallet text-yellow-500"></i> -->
      </div>
      <div>
        <p class="text-sm text-gray-500">My Balance</p>
        <p class="text-sm font-bold">₦12,750,000.00</p>
      </div>
    </div>

    <!-- Income Card -->
    <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
      <div class="bg-blue-100 p-3 rounded-full">
        <v-icon name="gi-receive-money" class="flex-shrink-0 w-5 h-5 text-blue-500" />
        <!-- <i class="fas fa-hand-holding-usd text-blue-500"></i> -->
      </div>
      <div>
        <p class="text-sm text-gray-500">Income (ROI)</p>
        <p class="text-sm font-bold text-green-400">+₦975,600.00</p>
      </div>
    </div>

    <!-- Expense Card -->
    <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
      <div class="bg-pink-100 p-3 rounded-full">
        <v-icon name="gi-money-stack" class="flex-shrink-0 w-5 h-5 text-red-400" />
        <!-- <i class="fas fa-money-bill-wave text-pink-500"></i> -->
      </div>
      <div>
        <p class="text-sm text-gray-500">Loan</p>
        <p class="text-sm font-bold text-red-400">-₦3,460,000.00</p>
      </div>
    </div>

    <!-- Total Saving Card -->
    <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
      <div class="bg-teal-100 p-3 rounded-full">
        <v-icon name="gi-swap-bag" class="flex-shrink-0 w-5 h-5 text-teal-500" />
        <i class="fas fa-piggy-bank text-teal-500"></i>
      </div>
      <div>
        <p class="text-sm text-gray-500">Total Savings</p>
        <p class="text-sm font-bold">₦7,920,000.00</p>
      </div>
    </div>
  </div>

  <!-- Markup -->
  <div class="p-5 bg-white rounded-md chart_area">
    <div id="chart" class="chart"></div>
  </div>
</template>
