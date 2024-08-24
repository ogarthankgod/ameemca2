<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import { Head, Link, usePage } from "@inertiajs/vue3";

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  pageSTate: String,
});

import {
  MdMarkemailunreadRound,
  SiMinutemailer,
  BiBarChartLineFill,
  MdCategorySharp,
  BiEnvelopePlusFill,
  HiSolidInboxIn,
  FcSupport,
} from "oh-vue-icons/icons";
import { addIcons } from "oh-vue-icons";

addIcons(
  MdMarkemailunreadRound,
  SiMinutemailer,
  BiBarChartLineFill,
  MdCategorySharp,
  BiEnvelopePlusFill,
  HiSolidInboxIn
);
const nairaSymbol = "₦";
const user = usePage().props.auth.user;

const categories = [
  {
    id: 1,
    name: "Account",
    count: 10,
  },
  {
    id: 2,
    name: "Loan",
    count: 0,
  },
  {
    id: 3,
    name: "Payment",
    count: 5,
  },
  {
    id: 4,
    name: "Video",
    count: 2,
  },
  {
    id: 5,
    name: "Investment",
    count: 20,
  },
];
</script>

<template>
  <AuthenticatedLayout>
    <div class="grid grid-cols-1 mb-7 mt-10 opacity-50">
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

    <SectionHead text="Support Dashboard" />

    <section class="flex-col w-full mb-6">
      <div class="flex flex-col sm:flex-row space-x-0 sm:space-x-3 mb-0 w-full">
        <div
          class="sm:grid grid-cols-1 sm:grid-cols-2 gap-4 mb-7 w-full space-y-2 sm:space-y-0"
        >
          <!-- New Emails -->
          <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
            <div class="bg-red-100 p-3 rounded-full">
              <v-icon name="si-minutemailer" class="flex-shrink-0 w-5 h-5 text-red-500" />
            </div>
            <div>
              <p class="text-md text-black">2,100</p>
              <p class="text-xs font-bold">New Emails</p>
            </div>
          </div>

          <!-- Unread Emails -->
          <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
            <div class="bg-teal-100 p-3 rounded-full">
              <v-icon
                name="md-markemailunread-round"
                class="flex-shrink-0 w-5 h-5 text-teal-500"
              />
            </div>
            <div>
              <p class="text-md text-black">200</p>
              <p class="text-xs font-bold">Unread Emails</p>
            </div>
          </div>

          <!-- Total Emails -->
          <div
            class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3 col-span-2"
          >
            <div class="bg-blue-100 p-3 rounded-full">
              <v-icon
                name="bi-bar-chart-line-fill"
                class="flex-shrink-0 w-5 h-5 text-blue-400"
              />
            </div>
            <div>
              <p class="text-md text-black">2,300</p>
              <p class="text-xs font-bold">Total Emails</p>
            </div>
          </div>
        </div>

        <!-- Categories -->
        <div class="bg-white rounded-lg shadow-sm sm:space-x-0 h-fit max-h-fit">
          <div class="bg-teal-100 flex p-2 mb-2 justify-center items-center">
            <v-icon name="md-category-sharp" class="text-teal-500 flex-shrink-0 w-4" />
            <p class="text-xs font-bold pl-3">Categories</p>
          </div>

          <div class="px-2 pb-2">
            <!-- Category - Outlined -->
            <span
              v-for="category in categories"
              :key="categoryx"
              class="inline-flex items-center justify-center rounded-full border border-purple-500 px-2.5 py-0.5 text-purple-700 m-[2px] hover:bg-purple-500 hover:text-white"
            >
              <p class="whitespace-nowrap text-xs">
                {{ category.name }} ({{ category.count }})
              </p>
            </span>
          </div>
        </div>
      </div>

      <section class="mt-7 sm:grid sm:grid-cols-12 gap-2 mb-7">
        <div class="bg-white shadow-md rounded-md sm:col-span-3 p-5 h-fit max-h-fit">
          <div class="flex flex-col justify-center items-center">
            <Link
              href=""
              class="w-full rounded-md bg-primary-900 text-white hover:bg-primary-800 p-2 mb-2 text-sm sm:text-base items-center"
            >
              <v-icon name="bi-envelope-plus-fill" class="" />
              Compose Mail
            </Link>
            <hr class="w-full" />
          </div>

          <div class="flex flex-col mt-2">
            <Link
              class="w-full flex p-2 rounded-md bg-blue-800 hover:bg-blue-900 text-white items-center"
              href=""
            >
              <v-icon name="hi-solid-inbox-in" class="" />
              <span class="px-1 text-sm sm:text-base">Inbox</span>
              <p>
                <span
                  class="flex items-center justify-center ml-2 rounded-full bg-red-500 text-white w-5 h-5 text-xs px-2 py-1"
                >
                  3
                </span>
              </p>
            </Link>

            <Link
              class="mt-2 w-full flex p-2 rounded-md bg-blue-800 hover:bg-blue-900 text-white items-center"
              href=""
            >
              <v-icon name="md-markemailunread-round" class="" />
              <span class="px-1 text-sm sm:text-base">Unread</span>
              <p>
                <span
                  class="flex items-center justify-center ml-2 rounded-full bg-red-500 text-white w-5 h-5 text-xs px-2 py-1"
                >
                  3
                </span>
              </p>
            </Link>
          </div>
        </div>

        <div class="sm:col-span-9 shadow-sm rounded-md bg-white p-4">
          <!-- Support Mail -->
          <!-- <Link v-for="categoryx in categories" :keys="categoryx" :href="`${categoryx}`"> -->
          <slot />
          <!-- Support Mail End -->
        </div>
      </section>

      <!-- <article class="rounded-lg border border-gray-100 bg-white p-6 shadow-sm">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
          <div class="p-6 text-gray-900">Messages!</div>
        </div>
      </article> -->
    </section>
  </AuthenticatedLayout>
</template>
