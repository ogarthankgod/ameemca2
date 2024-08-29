<script setup>
import { Head, Link, usePage, useForm } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import InputError from "@/Components/InputError.vue";

//Importing FlowBite Components
import { ref, watch, onMounted } from "vue";
import { initFlowbite } from "flowbite";

// initialize components based on data attribute selectors
onMounted(() => {
  initFlowbite();
});

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
  packageInfo: Object,
});

const user = usePage().props.auth.user;
const page = usePage().props;

const loanRequestForm = useForm({
  loanType: "",
  loantDuration: "",
  loanGuarantor1: "",
  loanGuarantor2: "",
  loanAmount: "",
  loanReason: "",
});

const loanTenure = ref(0);

const loanTypeChange = (packageTenure) => {
  if (loanRequestForm.loanType == 0) return;

  console.log("Type Changed to: " + loanRequestForm.loanType);

  if (loanRequestForm.loanType == 1) {
    console.log("Project Loan");
    loanTenure.value = packageTenure ?? 26;
    console.log(loanTenure.value);
  }

  if (loanRequestForm.loanType == 2) {
    console.log("Emmergency Loan");
    loanTenure.value = 26;
    console.log(loanTenure.value);
  }

  if (loanTenure.value > 0) console.log("Tenure Above 0");
};

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
          v-model="loanRequestForm.loanType"
          id="loanType"
          :onchange="loanTypeChange(packageInfo.packageTenure)"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
        >
          <option selected value="">Select Loan Type</option>
          <option value="1">Project Loan</option>
          <option value="2">Emergency Loan</option>
        </select>
        <InputError class="mt-1" :message="loanRequestForm.errors.loanType" />
      </div>

      <div class="mb-5">
        <label
          for="loanDuration"
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
        >
          Loan Tenure
        </label>
        <select
          v-model="loanRequestForm.loantDuration"
          id="loanDuration"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          value=""
        >
          <option selected value="">Loan Duration</option>
          <!-- <option
            :v-if="loanTenure.value > 0"
            :v-for="i in loanTenure.value"
            :key="i"
            :value="i"
          >
            {{ i }}
          </option> -->
        </select>
        <InputError class="mt2" :message="loanRequestForm.errors.loantDuration" />
      </div>

      <div class="grid grid-cols-2 gap-3">
        <div>
          <label
            for="loanGuarantor1"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            >Choose Guarantor (1)</label
          >
          <select
            v-model="loanRequestForm.loanGuarantor1"
            id="loanGuarantor1"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          >
            <option selected value="">Select Staff</option>
          </select>
          <InputError class="mt2" :message="loanRequestForm.errors.loanGuarantor1" />
        </div>

        <div class="mb-5">
          <label
            for="loanGuarantor2"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
            >Choose Guarantor (2)</label
          >
          <select
            v-model="loanRequestForm.loanGuarantor2"
            id="loanGuarantor2"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
            value=""
          >
            <option selected value="">Select Staff</option>
          </select>
          <InputError class="mt2" :message="loanRequestForm.errors.loanGuarantor2" />
        </div>
      </div>

      <div class="mb-5">
        <label
          for="loanAmount"
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Loan Amount</label
        >
        <input
          v-model="loanRequestForm.loanAmount"
          type="loanAmount"
          id="loanAmount"
          placeholder="0.00"
          class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light"
          required
        />
        <InputError class="mt2" :message="loanRequestForm.errors.loanAmountA" />
      </div>

      <div class="mb-5">
        <label
          for="loanReason"
          class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
          >Why do you need this loan?</label
        >
        <textarea
          v-model="loanRequestForm.loanReason"
          type="text"
          id="loanReason"
          class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light"
          required
        ></textarea>
        <InputError class="mt2" :message="loanRequestForm.errors.loanReason" />
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
          <span class="text-emerald-600 hover:underline dark:text-emerald-500">
            above loan calculation
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

  <div class="grid grid-cols-1 mb-7 opacity-50 hidden">
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
