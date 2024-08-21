<script setup>
import { Link } from "@inertiajs/vue3";
// import { onMounted } from "vue";
// import { initFlowbite } from "flowbite";

import {
  FaBook,
  FaChartPie,
  FaPiggyBank,
  FaComments,
  FaVideo,
  MdSettingssuggest,
  RiSettings3Fill,
  FaFire,
  MdSupportagentRound,
  OiLaw,
  RiRoadMapFill,
  GiFlagObjective,
} from "oh-vue-icons/icons";
import { addIcons } from "oh-vue-icons";

addIcons(
  FaBook,
  FaChartPie,
  FaPiggyBank,
  FaComments,
  FaVideo,
  MdSettingssuggest,
  RiSettings3Fill,
  FaFire,
  MdSupportagentRound,
  OiLaw,
  RiRoadMapFill,
  GiFlagObjective
);

// initialize components based on data attribute selectors
// onMounted(() => {
//     initFlowbite();
// });

const sidebarItems1 = [
  {
    id: 1,
    route: "dashboard",
    icon: "fa-chart-pie",
    text: "Dashboard",
  },
  {
    id: 2,
    route: "finance.index",
    icon: "fa-piggy-bank",
    text: "Finance",
  },
  {
    id: 21,
    route: "finance.index",
    icon: "fa-piggy-bank",
    text: "Loans",
    children: [
      {
        id: 1,
        route: "finance.index",
        icon: "FaChartPie",
        text: "Loan Request",
      },
      {
        id: 2,
        route: "finance.index",
        icon: "FaChartPie",
        text: "Loan History",
      },
      {
        id: 3,
        route: "finance.index",
        icon: "FaChartPie",
        text: "Loan Repayments",
      },
      {
        id: 4,
        route: "finance.index",
        icon: "FaChartPie",
        text: "Bulk Loan Repayments",
      },
    ],
  },
  {
    id: 3,
    route: "forum.index",
    icon: "fa-comments",
    text: "Forums",
  },
  {
    id: 4,
    route: "profile.edit",
    //ri-settings-3-fill
    icon: "md-settingssuggest",
    text: "Settings",
  },
  {
    id: 5,
    route: "video.index",
    icon: "fa-video",
    text: "Video Conference",
  },
  {
    id: 6,
    route: "upgrade.index",
    icon: "fa-fire",
    text: "Upgrade Package",
  },
];

const sidebarItems2 = [
  {
    id: 1,
    route: "support.index",
    icon: "md-supportagent-round",
    text: "Support",
  },
  {
    id: 2,
    route: "byelaws",
    icon: "oi-law",
    text: "Bye Laws",
  },
  {
    id: 3,
    route: "guidelines",
    icon: "ri-road-map-fill",
    text: "Operatioal Guidelines",
  },
  {
    id: 4,
    route: "objectives",
    icon: "gi-flag-objective",
    text: "Our Objectives",
  },
];
</script>

<template>
  <aside class="w-0 md:w-64" aria-label="Sidebar">
    <div
      class="fixed border-r-2 border-gray-200 left-auto top-16 mt-2.5 md:top-16 md:mt-0 z-40 min-h-screen transition-transform -translate-x-full md:translate-x-0 px-3 py-4 bg-gray-50 dark:bg-gray-800"
      id="logo-sidebar"
    >
      <ul class="space-y-2 font-medium">
        <li v-for="item in sidebarItems1" :key="item.id">
          <Link
            class="flex items-center w-full p-2 text-base text-gray-900 transition duration-75 rounded-lg group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"
            :href="route(item.route)"
            v-if="!item.children"
          >
            <v-icon
              :name="item.icon"
              class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"
            />

            <span class="flex-1 ms-3 text-left rtl:text-right whitespace-nowrap">{{
              item.text
            }}</span>

            <span
              v-if="item.pill"
              class="inline-flex items-center justify-center w-3 h-3 p-3 ms-3 text-sm font-medium text-blue-800 bg-blue-100 rounded-full dark:bg-blue-900 dark:text-blue-300"
              >3</span
            >
          </Link>

          <!-- has children -->
          <button
            href="#"
            class="flex items-center w-full p-2 text-base text-gray-900 transition duration-75 rounded-lg group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"
            :aria-controls="item.text + item.id"
            :data-collapse-toggle="item.text + item.id"
            v-else="item.children"
          >
            <v-icon
              :name="item.icon"
              class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"
            />

            <span class="flex-1 ms-3 text-left rtl:text-right whitespace-nowrap">{{
              item.text
            }}</span>
            <svg
              class="w-3 h-3"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 10 6"
            >
              <path
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="m1 1 4 4 4-4"
              />
            </svg>
          </button>
          <ul
            :id="item.text + item.id"
            class="hidden py-2 space-y-2"
            v-if="item.children"
          >
            <li v-for="child in item.children">
              <Link
                :href="route(child.route)"
                class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700 text-sm"
                >{{ child.text }}</Link
              >
            </li>
          </ul>
        </li>
      </ul>

      <ul
        class="pt-4 mt-4 space-y-2 font-medium border-t border-gray-200 dark:border-gray-700"
      >
        <li>
          <Link
            class="flex items-center p-2 text-gray-900 transition duration-75 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 dark:text-white group"
            v-for="item in sidebarItems2"
            :href="route(item.route)"
          >
            <v-icon
              :name="item.icon"
              class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white"
            />

            <span class="ms-3">{{ item.text }}</span>
          </Link>
        </li>
      </ul>
    </div>
  </aside>
</template>
