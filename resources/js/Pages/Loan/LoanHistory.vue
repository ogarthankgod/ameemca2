<script setup>
import { Head, Link, usePage } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";

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

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  pageState: String,
});

const user = usePage().props.auth.user;
</script>

<template>
  <Head title="Loan Portal" />
  <SectionHead text="Loan History" />

  <div class="bg-white rounded-md p-5 mb-5">Welcome, {{ user.firstname }} ..<br /></div>

  <SectionHead :text="pageState" />

  <div class="bg-white rounded-md p-1 mb-5">
    <table class="min-w-full divide-y-2 bg-white text-sm">
      <thead class="ltr:text-left rtl:text-right divide-y divide-gray-200">
        <tr>
          <div class="bg-white p-5">...</div>
        </tr>

        <tr>
          <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">SN</th>
          <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Amount</th>
          <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Loan Type</th>
          <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Status</th>
          <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Progress</th>
          <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Ref.</th>
          <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">Date</th>
        </tr>
      </thead>

      <tbody class="divide-y divide-gray-200 text-center">
        <tr>
          <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">1</td>
          <td class="whitespace-nowrap px-4 py-2 text-gray-700">₦1,000,000.00</td>
          <td class="whitespace-nowrap px-4 py-2 text-gray-700">Project Loan</td>

          <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
            <span
              class="inline-flex items-center justify-center rounded-full border border-red-500 px-2.5 py-0.5 text-red-400"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="-ms-1 me-1.5 size-4"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                />
              </svg>

              <p class="whitespace-nowrap text-sm">Pending</p>
            </span>
          </td>
          <td class="whitespace-nowrap px-4 py-2">
            <Link
              href="#"
              class="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
            >
              View
            </Link>
          </td>
          <td class="whitespace-nowrap px-4 py-2 text-gray-700">Tje344jfe</td>
          <td class="whitespace-nowrap px-4 py-2">2024-25-08</td>
        </tr>
      </tbody>
    </table>

    <div class="rounded-b-lg border-t border-gray-200 px-4 py-2">
      <ol class="flex justify-end gap-1 text-xs font-medium">
        <li>
          <a
            href="#"
            class="inline-flex size-8 items-center justify-center rounded border border-gray-100 bg-white text-gray-900 rtl:rotate-180"
          >
            <span class="sr-only">Prev Page</span>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="size-3"
              viewBox="0 0 20 20"
              fill="currentColor"
            >
              <path
                fill-rule="evenodd"
                d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                clip-rule="evenodd"
              />
            </svg>
          </a>
        </li>

        <li>
          <a
            href="#"
            class="block size-8 rounded border border-gray-100 bg-white text-center leading-8 text-gray-900"
          >
            1
          </a>
        </li>

        <li
          class="block size-8 rounded border-blue-600 bg-blue-600 text-center leading-8 text-white"
        >
          2
        </li>

        <li>
          <a
            href="#"
            class="block size-8 rounded border border-gray-100 bg-white text-center leading-8 text-gray-900"
          >
            3
          </a>
        </li>

        <li>
          <a
            href="#"
            class="block size-8 rounded border border-gray-100 bg-white text-center leading-8 text-gray-900"
          >
            4
          </a>
        </li>

        <li>
          <a
            href="#"
            class="inline-flex size-8 items-center justify-center rounded border border-gray-100 bg-white text-gray-900 rtl:rotate-180"
          >
            <span class="sr-only">Next Page</span>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="size-3"
              viewBox="0 0 20 20"
              fill="currentColor"
            >
              <path
                fill-rule="evenodd"
                d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                clip-rule="evenodd"
              />
            </svg>
          </a>
        </li>
      </ol>
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
