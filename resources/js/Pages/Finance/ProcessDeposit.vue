<script setup>
import { Head, usePage, useForm } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import PaystackPop from "@paystack/inline-js";
import WalletHistory from "./WalletHistory.vue";
import modalButton from "@/Components/Modals/modalButton.vue";
import AlertModal from "@/Components/Modals/Alert.vue";

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

//Importing FlowBite Components
import { onMounted, ref } from "vue";
import { initFlowbite } from "flowbite";

// initialize components based on data attribute selectors
onMounted(() => {
  initFlowbite();

  const app = document.getElementById("app");
  app.nextElementSibling.remove();
});

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  response: String,
});

const user = usePage().props.auth.user;
const page = usePage().props;
const access_code = JSON.parse(page.response).data.access_code;

const popup = new PaystackPop();
popup.resumeTransaction(access_code);

const processDepositForm = useForm({
  access_code: "",
});

const processDepositSubmit = async () => {
  processDepositForm.post(route("finance.index"), {
    onSuccess: () => {
      const response = JSON.parse(usePage().props.response);

      const access_code = response.data.access_code;

      const popup = new PaystackPop();
      popup.resumeTransaction(access_code);
    },
    onError: (error) => {
      console.log(error);
    },
  });
};
</script>

<template>
  <Head title="Process Transaction" />
  <SectionHead text="Wallet" />

  <div class="bg-white rounded-md p-5 mb-5">
    {{ greeting }}, {{ user.firstname }} ..<br />
  </div>

  <!-- Process Deposit Modal toggle -->
  <button
    data-modal-target="process-modal"
    data-modal-toggle="process-modal"
    class="inline text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 mb-5"
    type="button"
  >
    Process Deposit
  </button>

  <!-- Process Deposit modal -->
  <div
    id="process-modal"
    tabindex="-1"
    aria-hidden="true"
    class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full"
  >
    <div class="relative p-4 w-full max-w-md max-h-full">
      <!-- Modal content -->
      <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
        <!-- Modal header -->
        <div
          class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600"
        >
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
            Deposit into Wallet
          </h3>

          <button
            type="button"
            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
            data-modal-toggle="process-modal"
          >
            <svg
              class="w-3 h-3"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 14 14"
            >
              <path
                stroke="currentColor"
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"
              />
            </svg>
            <span class="sr-only">Close modal</span>
          </button>
        </div>
        <!-- Modal body -->
        <form
          class="p-4 md:p-5"
          name="processDepositSubmit"
          id="processDepositSubmit"
          @submit.prevent="false"
        >
          <div id="processDepositForm"></div>
          <ul class="text-xs text-gray-600 mb-5 list-disc list-inside">
            <li>
              Keep away some money for rainy days... Fund your AMEEMCA wallet today.
            </li>
            <li v-if="processDepositForm.walletType == 1" class="mt-2 text-red-500">
              NOTE: This money goes to your AMEEMCA savings wallet not your Contribution
              wallet.
            </li>
          </ul>

          <button
            :disabled="processDepositForm.processing"
            :class="{ 'opacity-25': processDepositForm.processing }"
            type=""
            class="text-white inline-flex items-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
          >
            <v-icon
              v-if="processDepositForm.processing"
              name="pr-spinner"
              class="animate-spin"
            ></v-icon>

            Proceed
          </button>
        </form>
      </div>
    </div>
  </div>
  <div class="bg-white rounded-md p-5 mb-5">..<br /></div>
  <WalletHistory />
</template>
