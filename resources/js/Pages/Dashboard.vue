<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import { Head, usePage } from "@inertiajs/vue3";
import UserInformation from "./Profile/Partials/UserInformation.vue";

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
const nairaSymbol = "₦";
const user = usePage().props.auth.user;

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  greeting: String,
  time: String,
  accountBalance: String,
  investment: String,
  loanBalance: String,
  contributionBalance: String,
});
</script>

<template>
  <Head title="Dashboard" />
  <SectionHead text="Dashboard" />

  <section class="flex-col w-full">
    <h2 class="hidden font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>

    <div class="py-4 mx-auto hidden">
      <div class="max-w-7xl mx-auto :sm:px-6 :lg:px-8 space-y-6">
        <div class="p-4 sm:p-8 bg-white shadow rounded-md sm:rounded-lg">
          <UserInformation class="max-w-xl" />
        </div>
      </div>
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
          <p class="text-sm font-bold">₦{{ accountBalance }}</p>
        </div>
      </div>

      <!-- Investments Card -->
      <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
        <div class="bg-blue-100 p-3 rounded-full">
          <v-icon name="gi-receive-money" class="flex-shrink-0 w-5 h-5 text-blue-500" />
          <!-- <i class="fas fa-hand-holding-usd text-blue-500"></i> -->
        </div>
        <div>
          <p class="text-sm text-gray-500">Investments (ROI)</p>
          <p class="text-sm font-bold text-green-400">+20%</p>
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
          <p class="text-sm font-bold text-red-400">-₦ {{ loanBalance }}</p>
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

    <div class="max-w-7xl mx-auto mt-7 :sm:px-6 :lg:px-8 mb-3 font-bold">Stats.</div>
    <article class="rounded-lg border border-gray-100 bg-white p-6">
      <div class="flex items-center justify-between">
        <div>
          <p class="text-sm text-gray-500">Investments</p>

          <p class="text-sm font-medium text-gray-900">₦2,896,000.94</p>
        </div>

        <span class="rounded-full bg-blue-100 p-3 text-blue-600">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-8 w-8"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            stroke-width="2"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M17 9V7a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2m2 4h10a2 2 0 002-2v-6a2 2 0 00-2-2H9a2 2 0 00-2 2v6a2 2 0 002 2zm7-5a2 2 0 11-4 0 2 2 0 014 0z"
            />
          </svg>
        </span>
      </div>

      <div class="mt-1 flex gap-1 text-green-600">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-4 w-4"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"
          />
        </svg>

        <p class="flex gap-2 text-xs">
          <span class="font-medium"> 62.81% </span>

          <span class="text-gray-500"> Since last week </span>
        </p>
      </div>

      <div class="mt-1 flex gap-1 text-red-600">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-4 w-4"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M13 17h8m0 0V9m0 8l-8-8-4 4-6-6"
          />
        </svg>

        <p class="flex gap-2 text-xs">
          <span class="font-medium"> -17.81% </span>

          <span class="text-gray-500"> Since last year </span>
        </p>
      </div>
    </article>

    <div class="max-w-7xl mx-auto mt-7 :sm:px-6 :lg:px-8 mb-3 font-bold">
      Last Transactions
    </div>

    <!-- Transactions List -->
    <section class="flex space-x-4 max-w-full mb-7 justify-center">
      <div class="max-w-full w-full">
        <table class="bg-white w-full rounded-lg">
          <tbody>
            <tr>
              <!-- <td></td> -->
              <td class="flex p-2">
                <div class="bg-pink-100 p-3 rounded-full w-fit mr-2">
                  <v-icon
                    name="io-cash-outline"
                    class="flex-shrink-0 w-5 h-5 text-teal-500"
                  />
                  <!-- <i class="fas fa-spotify text-teal-500"></i> -->
                </div>
                <div class="flex flex-col">
                  <span class="text-gray-900 font-medium text-xs">Contribution</span>
                  <span class="text-gray-500 text-xs">25<sup>th</sup> Jan 2024</span>
                </div>
              </td>
              <td class="text-xs text-yellow-500">Pending</td>
              <td class="text-xs text-red-500">-{{ nairaSymbol }}150,000,000.00</td>
            </tr>

            <tr>
              <!-- <td></td> -->
              <td class="flex p-2">
                <div class="bg-teal-100 p-3 rounded-full w-fit mr-2">
                  <v-icon
                    name="io-cash-outline"
                    class="flex-shrink-0 w-5 h-5 text-teal-500"
                  />
                  <!-- <i class="fas fa-spotify text-teal-500"></i> -->
                </div>
                <div class="flex flex-col">
                  <span class="text-gray-900 font-medium text-xs">Deposit</span>
                  <span class="text-gray-500 text-xs">3<sup>rd</sup> Jul 2024</span>
                </div>
              </td>
              <td class="text-xs text-green-500">Completed</td>
              <td class="text-xs text-green-500">+{{ nairaSymbol }}150,000,000.00</td>
            </tr>
          </tbody>
        </table>
        <div class="flex justify-end">
          <span class="hover:underline font-medium text-sm pr-3 pt-2 p-1">View all</span>
        </div>
      </div>
      <!-- 
      <div
        class="h-full bg-gradient-to-r from-blue-400 to-blue-600 text-white p-6 rounded-lg shadow-lg w-[40%] hidden md:flex"
      >
        <div class="flex flex-col h-full w-full">
          <div class="flex justify-between">
            <div class="flex flex-col justify-between mb-1">
              <span class="text-sm">Balance</span>
              <span class="text-xs font-medium">{{ nairaSymbol }}5,756,098</span>
            </div>
            <div>
              <v-icon name="fc-sim-card-chip" />
            </div>
          </div>
          <div class="mt-1">
            <div class="flex justify-between">
              <span class="text-xs">CARD HOLDER</span>
              <span class="block text-xs font-medium"
                >{{ user.firstname }} {{ user.lastname }}</span
              >
            </div>
            <div class="flex justify-between items-center mt-2">
              <span class="text-xs">VALID THRU</span>
              <span class="text-xs">12/27</span>
            </div>
            <div class="mt-2 flex justify-between items-center">
              <span class="text-xs">3778 **** **** 1234</span>
              <v-icon name="ri-mastercard-fill" />
            </div>
          </div>
        </div>
      </div> -->
    </section>

    <div class="flex flex-col md:flex-row gap-4"></div>
  </section>
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
      <div><span class="font-medium">!!</span> Background Jobs aree still Compiling.</div>
    </div>
  </div>
</template>
