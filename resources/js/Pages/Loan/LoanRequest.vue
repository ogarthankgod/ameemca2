<script setup>
import { Head, Link, usePage, useForm } from "@inertiajs/vue3";
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
  PrSpinner,
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
  FcSimCardChip,
  PrSpinner
);

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  pageState: String,
});

const user = usePage().props.auth.user;
const page = usePage().props;

const loanRequestForm = useForm({
  loantType: "1",
  amount: "",
  realAmount: 0,
  desc: "EMMANUEL",
  email: user.email,
  transType: "deposit",
});

const loanRequestSubmit = async () => {
  loanRequestForm.realAmount = amount * 100;
  loanRequestForm
    .transform((data) => ({
      ...data,
      amount: calcPaymentFee(data.amount),
    }))
    .post(route("loan.index"), {
      onSuccess: () => {
        const response = JSON.parse(usePage().props.response);
      },
      onError: (error) => {
        console.error(error);
      },
    });
};
</script>

<template>
  <Head title="Loan Portal" />
  <SectionHead text="Loan Dashboard" />

  <div class="bg-white rounded-md p-5 mb-5">Welcome, {{ user.firstname }} ..<br /></div>

  <SectionHead text="Loan Request" />
  <div class="bg-gray-100 rounded-md p-5 mb-5">
    <form class="max-w-sm mx-auto">
      <div class="mb-4">
        <label
          for="loanType"
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Select Loan Type</label
        >
        <select
          id="loanType"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        >
          <option selected>Select Loan Type</option>
          <option value="EL">Project Loan</option>
          <option value="PL">Emergency Loan</option>
        </select>
      </div>

      <div class="mb-5">
        <label
          for="loanType"
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Loan Tenure</label
        >
        <select
          id="loanType"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        >
          <option selected>Loan Duration</option>
        </select>
      </div>

      <div class="grid grid-cols-2 gap-3">
        <div>
          <label
            for="loanType"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            >Choose Guarantor (1)</label
          >
          <select
            id="loanType"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          >
            <option selected>Select Staff</option>
          </select>
        </div>

        <div>
          <label
            for="loanType"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            >Choose Guarantor (2)</label
          >
          <select
            id="loanType"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          >
            <option selected>Select Staff</option>
          </select>
        </div>
      </div>

      <div class="mb-5">
        <label
          for="amount"
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Loan Amount</label
        >
        <input
          type="loanAmount"
          id="loanAmount"
          placeholder="0.00"
          class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light"
          required
        />
      </div>

      <div class="mb-5">
        <label
          for="password"
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Why do you need this loan?</label
        >
        <textarea
          type="text"
          id="loanReason"
          class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light"
          required
        ></textarea>
      </div>

      <div class="flex items-start mb-5">
        <div class="flex items-center h-5">
          <input
            id="terms"
            type="checkbox"
            value=""
            class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800"
            required
          />
        </div>

        <label
          for="terms"
          class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
          >I agree with the
          <span href="#" class="text-blue-600 hover:underline dark:text-blue-500">
            terms and conditions
          </span>
        </label>
      </div>

      <button
        :disabled="loanRequestForm.processing"
        :class="{ 'opacity-25': loanRequestForm.processing }"
        type="submit"
        class="text-white inline-flex items-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
      >
        <v-icon
          v-if="loanRequestForm.processing"
          name="pr-spinner"
          class="animate-spin"
        ></v-icon>

        Apply Loan
      </button>
    </form>
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
