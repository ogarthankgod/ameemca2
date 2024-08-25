<script setup>
import { Head, Link, usePage, useForm } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import PaystackPop from "@paystack/inline-js";
import InputError from "@/Components/InputError.vue";

//Importing FlowBite Components
import { onMounted } from "vue";
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
  greeting: String,
  time: String,
  accountBalance: String,
  income: String,
  loanBalance: String,
  contributionBalance: String,
  response: String,
});

const user = usePage().props.auth.user;
const page = usePage().props;

const depositForm = useForm({
  walletType: "1",
  amount: "",
  realAmount: 0,
  desc: "EMMANUEL",
  email: user.email,
  transType: "deposit",
});

//PayStack Integration
const calcPaymentFee = (amount) => {
  var a = (amount * 1.5) / 100;
  var b = (a * 1.5) / 100;
  var c = Math.ceil(a + b);

  if (c <= 1995) {
    return amount * 100 + c * 100;
  } else {
    a = 2000;
    b = (a * 1.5) / 100;
    c = (b + a) * 100;
    return amount * 100 + c;
  }
};

const depositSubmit = async () => {
  depositForm.realAmount = amount * 100;
  depositForm
    .transform((data) => ({
      ...data,
      amount: calcPaymentFee(data.amount),
    }))
    .post(route("finance.index"), {
      onSuccess: () => {
        const response = JSON.parse(usePage().props.response);
        const access_code = response.data.access_code;

        const popup = new PaystackPop();
        popup.resumeTransaction(access_code);
      },
      onError: (error) => {
        console.error(error);
      },
    });
};

// function payWithPaystack(e) {
//   e.preventDefault();
//   var amount = calculatePaymentFee(document.getElementById("amount").value);
//   var real_amount = document.getElementById("amount").value * 100;
//   let handler = PaystackPop.setup({
//     key: "pk_test_017339973125c877c7ddb9fae77f14e6ad607269",
//     // key: "<?php echo $public_key_live; ?>",
//     email: document.getElementById("email").value,
//     amount: amount,
//     ref: "DEPOSIT_" + Math.floor(Math.random() * 1000000000 + 1),
//     metadata: {
//       custom_fields: [
//         {
//           type: document.getElementById("transType").value,
//           real_amt: real_amount,
//         },
//       ],
//     },
//     onClose: function () {
//       console.log("Transaction Cancelled.");
//     },
//     callback: function (response) {
//       verifyDeposit(response.reference);
//     },
//   });
//   handler.openIframe();
// }

// function verifyDeposit(token) {
//   $.ajax({
//     url: route("finance.deposit"),
//     // url: "authController/deposit_process.php",
//     type: "POST",
//     beforeSend: function () {},
//     data: {
//       action: "verify",
//       token: token,
//     },
//     dataType: "json",
//     success: function (data) {
//       if (data.approved) {
//         $("#depositForm").html(data.notice);
//       }
//       if (data.failed) {
//         $("#depositForm").html(data.notice);
//       }
//       if (data.error) {
//       }
//     },
//     error: function (jqXHR, textStatus, errorThrown) {
//       console.log(textStatus, errorThrown);
//     },
//   });
// }
</script>

<template>
  <Head title="Wallet Dashboard" />
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
        <p class="text-sm text-gray-500">Savings Balance</p>
        <p class="text-sm font-bold">₦ {{ accountBalance }}</p>
      </div>
    </div>

    <!-- Income Card -->
    <div class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3">
      <div class="bg-blue-100 p-3 rounded-full">
        <v-icon name="gi-receive-money" class="flex-shrink-0 w-5 h-5 text-blue-500" />
        <!-- <i class="fas fa-hand-holding-usd text-blue-500"></i> -->
      </div>
      <div>
        <p class="text-sm text-gray-500">Investments (ROI)</p>
        <p class="text-sm font-bold text-green-400">+10%</p>
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

  <!-- Deposit Modal toggle -->
  <button
    data-modal-target="deposit-modal"
    data-modal-toggle="deposit-modal"
    class="inline text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 mb-5"
    type="button"
  >
    Deposit Funds
  </button>

  <!-- Deposit modal -->
  <div
    id="deposit-modal"
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
            data-modal-toggle="deposit-modal"
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
          name="depositSubmit"
          id="depositSubmit"
          @submit.prevent="depositSubmit"
        >
          <div id="depositForm"></div>
          <ul class="text-xs text-gray-600 mb-5 list-disc list-inside">
            <li>
              Keep away some money for rainy days... Fund your AMEEMCA wallet today.
            </li>
            <li v-if="depositForm.walletType == 1" class="mt-2 text-red-500">
              NOTE: This money goes to your AMEEMCA savings wallet not your Contribution
              wallet.
            </li>
          </ul>

          <input v-model="depositForm.email" type="hidden" name="email" id="email" />
          <input
            v-model="depositForm.transType"
            type="hidden"
            name="transType"
            id="transType"
          />

          <div class="grid gap-4 mb-4 grid-cols-2">
            <div class="col-span-2 sm:col-span-2">
              <label
                for="walletType"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
              >
                Wallet
              </label>
              <select
                id="walletType"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                v-model="depositForm.walletType"
                required
              >
                <option value="" selected="">Select Wallet</option>
                <option value="1">Savings Wallet</option>
                <option value="2">Manual Contribution</option>
                <option value="3">VTU wallet</option>
              </select>
              <InputError class="mt2" :message="depositForm.errors.walletType" />
            </div>

            <div class="col-span-2 sm:col-span-2">
              <label
                for="amount"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                >Amount</label
              >
              <input
                v-model="depositForm.amount"
                type="text"
                name="amount"
                id="amount"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="₦1,000.00"
                required
              />
              <InputError class="mt2" :message="depositForm.errors.amount" />
            </div>

            <div class="col-span-2">
              <label
                for="description"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                >Description/Remark</label
              >
              <textarea
                v-model="depositForm.desc"
                id="description"
                rows="4"
                class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="Write Descrption or remark here"
              ></textarea>
              <InputError class="mt2" :message="depositForm.errors.desc" />
            </div>
          </div>

          <button
            :disabled="depositForm.processing"
            :class="{ 'opacity-25': depositForm.processing }"
            type="submit"
            class="text-white inline-flex items-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
          >
            <v-icon
              v-if="depositForm.processing"
              name="pr-spinner"
              class="animate-spin"
            ></v-icon>

            Proceed
          </button>
        </form>
      </div>
    </div>
  </div>

  <!--Withdraw Modal toggle -->
  <button
    data-modal-target="withdraw-modal"
    data-modal-toggle="withdraw-modal"
    class="inline ml-5 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 mb-5"
    type="button"
  >
    Withdraw Funds
  </button>

  <!-- Withdraw modal -->
  <div
    id="withdraw-modal"
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
            Funds Withdrawal
          </h3>

          <button
            type="button"
            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
            data-modal-toggle="withdraw-modal"
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
        <form class="p-4 md:p-5" name="paymentForm" id="paymentForm">
          <ul class="text-xs text-gray-600 mb-5 list-disc list-inside">
            <li>Withdraw funds from your AMEEMCA savings wallet to your local bank.</li>
            <li>NOTE: This might take up to 24hrs processing period.</li>
          </ul>

          <div class="grid gap-4 mb-4 grid-cols-2">
            <div class="col-span-2 sm:col-span-2">
              <label
                for="category"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
              >
                Bank
              </label>
              <select
                id="category"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
              >
                <option selected="">Select Bank</option>
              </select>
            </div>

            <div class="col-span-2 sm:col-span-2">
              <label
                for="amount"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                >Amount</label
              >
              <input
                type="number"
                name="amount"
                id="amount"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="₦1,000,000.00"
                required=""
              />
            </div>

            <div class="col-span-2">
              <label
                for="description"
                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
              >
                Description/Remark
              </label>

              <textarea
                id="description"
                rows="4"
                class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="Write Descrption or remark here"
              ></textarea>
            </div>
          </div>

          <button
            type="submit"
            class="text-white inline-flex items-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
          >
            <svg
              class="me-1 -ms-1 w-5 h-5"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fill-rule="evenodd"
                d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
                clip-rule="evenodd"
              ></path>
            </svg>
            Proceed
          </button>
        </form>
      </div>
    </div>
  </div>
</template>
