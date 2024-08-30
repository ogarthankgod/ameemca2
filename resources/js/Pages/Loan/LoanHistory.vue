<script setup>
import { Head, Link, usePage } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import {
  DataTable,
  exportCSV,
  exportJSON,
  exportSQL,
  exportTXT,
} from "simple-datatables";

//Importing FlowBite Components
import { onMounted } from "vue";
import { initFlowbite, Dropdown } from "flowbite";

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
  loanHistory: Object,
});

const user = usePage().props.auth.user;

// initialize components based on data attribute selectors
onMounted(() => {
  initFlowbite();

  if (document.getElementById("finance-table") && typeof DataTable !== "undefined") {
    const exportCustomCSV = function (dataTable, userOptions = {}) {
      // A modified CSV export that includes a row of minuses at the start and end.
      const clonedUserOptions = {
        ...userOptions,
      };
      clonedUserOptions.download = false;
      const csv = exportCSV(dataTable, clonedUserOptions);
      // If CSV didn't work, exit.
      if (!csv) {
        return false;
      }
      const defaults = {
        download: true,
        lineDelimiter: "\n",
        columnDelimiter: ";",
      };
      const options = {
        ...defaults,
        ...clonedUserOptions,
      };
      const separatorRow = Array(
        dataTable.data.headings.filter(
          (_heading, index) => !dataTable.columns.settings[index]?.hidden
        ).length
      )
        .fill("+")
        .join("+"); // Use "+" as the delimiter

      const str =
        separatorRow + options.lineDelimiter + csv + options.lineDelimiter + separatorRow;

      if (userOptions.download) {
        // Create a link to trigger the download
        const link = document.createElement("a");
        link.href = encodeURI("data:text/csv;charset=utf-8," + str);
        link.download = (options.filename || user.staffid + "_datatable_export") + ".txt";
        // Append the link
        document.body.appendChild(link);
        // Trigger the download
        link.click();
        // Remove the link
        document.body.removeChild(link);
      }

      return str;
    };

    const table = new DataTable("#finance-table", {
      template: (options, dom) =>
        "<div class='" +
        options.classes.top +
        "'>" +
        "<div class='flex flex-col sm:flex-row sm:items-center space-y-4 sm:space-y-0 sm:space-x-3 rtl:space-x-reverse w-full sm:w-auto'>" +
        (options.paging && options.perPageSelect
          ? "<div class='" +
            options.classes.dropdown +
            "'>" +
            "<label>" +
            "<select class='" +
            options.classes.selector +
            "'></select> " +
            options.labels.perPage +
            "</label>" +
            "</div>"
          : "") +
        "<button id='exportDropdownButton' type='button' class='flex w-full items-center justify-center rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm font-medium text-gray-900 hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:outline-none focus:ring-4 focus:ring-gray-100 dark:border-gray-600 dark:bg-gray-800 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white dark:focus:ring-gray-700 sm:w-auto'>" +
        "Export as" +
        "<svg class='-me-0.5 ms-1.5 h-4 w-4' aria-hidden='true' xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='none' viewBox='0 0 24 24'>" +
        "<path stroke='currentColor' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m19 9-7 7-7-7' />" +
        "</svg>" +
        "</button>" +
        "<div id='exportDropdown' class='z-10 hidden w-52 divide-y divide-gray-100 rounded-lg bg-white shadow dark:bg-gray-700' data-popper-placement='bottom'>" +
        "<ul class='p-2 text-left text-sm font-medium text-gray-500 dark:text-gray-400' aria-labelledby='exportDropdownButton'>" +
        "<li>" +
        "<button id='export-csv' class='group inline-flex w-full items-center rounded-md px-3 py-2 text-sm text-gray-500 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-600 dark:hover:text-white'>" +
        "<svg class='me-1.5 h-4 w-4 text-gray-400 group-hover:text-gray-900 dark:text-gray-400 dark:group-hover:text-white' aria-hidden='true' xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' viewBox='0 0 24 24'>" +
        "<path fill-rule='evenodd' d='M9 2.221V7H4.221a2 2 0 0 1 .365-.5L8.5 2.586A2 2 0 0 1 9 2.22ZM11 2v5a2 2 0 0 1-2 2H4a2 2 0 0 0-2 2v7a2 2 0 0 0 2 2 2 2 0 0 0 2 2h12a2 2 0 0 0 2-2 2 2 0 0 0 2-2v-7a2 2 0 0 0-2-2V4a2 2 0 0 0-2-2h-7Zm1.018 8.828a2.34 2.34 0 0 0-2.373 2.13v.008a2.32 2.32 0 0 0 2.06 2.497l.535.059a.993.993 0 0 0 .136.006.272.272 0 0 1 .263.367l-.008.02a.377.377 0 0 1-.018.044.49.49 0 0 1-.078.02 1.689 1.689 0 0 1-.297.021h-1.13a1 1 0 1 0 0 2h1.13c.417 0 .892-.05 1.324-.279.47-.248.78-.648.953-1.134a2.272 2.272 0 0 0-2.115-3.06l-.478-.052a.32.32 0 0 1-.285-.341.34.34 0 0 1 .344-.306l.94.02a1 1 0 1 0 .043-2l-.943-.02h-.003Zm7.933 1.482a1 1 0 1 0-1.902-.62l-.57 1.747-.522-1.726a1 1 0 0 0-1.914.578l1.443 4.773a1 1 0 0 0 1.908.021l1.557-4.773Zm-13.762.88a.647.647 0 0 1 .458-.19h1.018a1 1 0 1 0 0-2H6.647A2.647 2.647 0 0 0 4 13.647v1.706A2.647 2.647 0 0 0 6.647 18h1.018a1 1 0 1 0 0-2H6.647A.647.647 0 0 1 6 15.353v-1.706c0-.172.068-.336.19-.457Z' clip-rule='evenodd'/>" +
        "</svg>" +
        "<span>Export CSV</span>" +
        "</button>" +
        "</li>" +
        "<li>" +
        "<button id='export-json' class='group inline-flex w-full items-center rounded-md px-3 py-2 text-sm text-gray-500 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-600 dark:hover:text-white'>" +
        "<svg class='me-1.5 h-4 w-4 text-gray-400 group-hover:text-gray-900 dark:text-gray-400 dark:group-hover:text-white' aria-hidden='true' xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' viewBox='0 0 24 24'>" +
        "<path fill-rule='evenodd' d='M9 2.221V7H4.221a2 2 0 0 1 .365-.5L8.5 2.586A2 2 0 0 1 9 2.22ZM11 2v5a2 2 0 0 1-2 2H4v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2h-7Zm-.293 9.293a1 1 0 0 1 0 1.414L9.414 14l1.293 1.293a1 1 0 0 1-1.414 1.414l-2-2a1 1 0 0 1 0-1.414l2-2a1 1 0 0 1 1.414 0Zm2.586 1.414a1 1 0 0 1 1.414-1.414l2 2a1 1 0 0 1 0 1.414l-2 2a1 1 0 0 1-1.414-1.414L14.586 14l-1.293-1.293Z' clip-rule='evenodd'/>" +
        "</svg>" +
        "<span>Export JSON</span>" +
        "</button>" +
        "</li>" +
        "<li>" +
        "<button id='export-txt' class='group inline-flex w-full items-center rounded-md px-3 py-2 text-sm text-gray-500 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-600 dark:hover:text-white'>" +
        "<svg class='me-1.5 h-4 w-4 text-gray-400 group-hover:text-gray-900 dark:text-gray-400 dark:group-hover:text-white' aria-hidden='true' xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' viewBox='0 0 24 24'>" +
        "<path fill-rule='evenodd' d='M9 2.221V7H4.221a2 2 0 0 1 .365-.5L8.5 2.586A2 2 0 0 1 9 2.22ZM11 2v5a2 2 0 0 1-2 2H4v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2h-7ZM8 16a1 1 0 0 1 1-1h6a1 1 0 1 1 0 2H9a1 1 0 0 1-1-1Zm1-5a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2H9Z' clip-rule='evenodd'/>" +
        "</svg>" +
        "<span>Export TXT</span>" +
        "</button>" +
        "</li>" +
        "<li>" +
        "<button id='export-sql' class='group inline-flex w-full items-center rounded-md px-3 py-2 text-sm text-gray-500 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-600 dark:hover:text-white'>" +
        "<svg class='me-1.5 h-4 w-4 text-gray-400 group-hover:text-gray-900 dark:text-gray-400 dark:group-hover:text-white' aria-hidden='true' xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' viewBox='0 0 24 24'>" +
        "<path d='M12 7.205c4.418 0 8-1.165 8-2.602C20 3.165 16.418 2 12 2S4 3.165 4 4.603c0 1.437 3.582 2.602 8 2.602ZM12 22c4.963 0 8-1.686 8-2.603v-4.404c-.052.032-.112.06-.165.09a7.75 7.75 0 0 1-.745.387c-.193.088-.394.173-.6.253-.063.024-.124.05-.189.073a18.934 18.934 0 0 1-6.3.998c-2.135.027-4.26-.31-6.3-.998-.065-.024-.126-.05-.189-.073a10.143 10.143 0 0 1-.852-.373 7.75 7.75 0 0 1-.493-.267c-.053-.03-.113-.058-.165-.09v4.404C4 20.315 7.037 22 12 22Zm7.09-13.928a9.91 9.91 0 0 1-.6.253c-.063.025-.124.05-.189.074a18.935 18.935 0 0 1-6.3.998c-2.135.027-4.26-.31-6.3-.998-.065-.024-.126-.05-.189-.074a10.163 10.163 0 0 1-.852-.372 7.816 7.816 0 0 1-.493-.268c-.055-.03-.115-.058-.167-.09V12c0 .917 3.037 2.603 8 2.603s8-1.686 8-2.603V7.596c-.052.031-.112.059-.165.09a7.816 7.816 0 0 1-.745.386Z'/>" +
        "</svg>" +
        "<span>Export SQL</span>" +
        "</button>" +
        "</li>" +
        "</ul>" +
        "</div>" +
        "</div>" +
        (options.searchable
          ? "<div class='" +
            options.classes.search +
            "'>" +
            "<input class='" +
            options.classes.input +
            "' placeholder='" +
            options.labels.placeholder +
            "' type='search' title='" +
            options.labels.searchTitle +
            "'" +
            (dom.id ? " aria-controls='" + dom.id + "'" : "") +
            ">" +
            "</div>"
          : "") +
        "</div>" +
        "<div class='" +
        options.classes.container +
        "'" +
        (options.scrollY.length
          ? " style='height: " + options.scrollY + "; overflow-Y: auto;'"
          : "") +
        "></div>" +
        "<div class='" +
        options.classes.bottom +
        "'>" +
        (options.paging ? "<div class='" + options.classes.info + "'></div>" : "") +
        "<nav class='" +
        options.classes.pagination +
        "'></nav>" +
        "</div>",
    });
    const $exportButton = document.getElementById("exportDropdownButton");
    const $exportDropdownEl = document.getElementById("exportDropdown");
    const dropdown = new Dropdown($exportDropdownEl, $exportButton);
    // console.log(dropdown);

    document.getElementById("export-csv").addEventListener("click", () => {
      exportCSV(table, {
        download: true,
        lineDelimiter: "\n",
        columnDelimiter: ";",
      });
    });
    document.getElementById("export-sql").addEventListener("click", () => {
      exportSQL(table, {
        download: true,
        tableName: "export_table",
      });
    });
    document.getElementById("export-txt").addEventListener("click", () => {
      exportTXT(table, {
        download: true,
      });
    });
    document.getElementById("export-json").addEventListener("click", () => {
      exportJSON(table, {
        download: true,
        space: 3,
      });
    });
  }
});
</script>

<template>
  <Head title="Loan Portal" />
  <SectionHead text="Loan History" />

  <div class="bg-white rounded-md p-5 mb-5">Welcome, {{ user.firstname }} ..<br /></div>

  <SectionHead :text="pageState" />

  <div class="bg-white rounded-md p-1 mb-5">
    <table id="finance-table">
      <thead>
        <tr>
          <th>
            <span class="flex items-center">
              SN
              <svg
                class="w-4 h-4 ms-1"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="m8 15 4 4 4-4m0-6-4-4-4 4"
                />
              </svg>
            </span>
          </th>
          <th>
            <span class="flex items-center">
              Amount
              <svg
                class="w-4 h-4 ms-1"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="m8 15 4 4 4-4m0-6-4-4-4 4"
                />
              </svg>
            </span>
          </th>
          <th>
            <span class="flex items-center">
              Type
              <svg
                class="w-4 h-4 ms-1"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="m8 15 4 4 4-4m0-6-4-4-4 4"
                />
              </svg>
            </span>
          </th>
          <th>
            <span class="flex items-center">
              Status
              <svg
                class="w-4 h-4 ms-1"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="m8 15 4 4 4-4m0-6-4-4-4 4"
                />
              </svg>
            </span>
          </th>
          <th class="hidden">
            <span class="flex items-center">
              Progress
              <svg
                class="w-4 h-4 ms-1"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="m8 15 4 4 4-4m0-6-4-4-4 4"
                />
              </svg>
            </span>
          </th>
          <th class="hidden">
            <span class="flex items-center">
              Ref.
              <svg
                class="w-4 h-4 ms-1"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="m8 15 4 4 4-4m0-6-4-4-4 4"
                />
              </svg>
            </span>
          </th>
          <th data-type="date" data-format="YYYY/DD/MM">
            <span class="flex items-center">
              Date
              <svg
                class="w-4 h-4 ms-1"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                fill="none"
                viewBox="0 0 24 24"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="m8 15 4 4 4-4m0-6-4-4-4 4"
                />
              </svg>
            </span>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="loanData in loanHistory"
          :key="loanData.span"
          class="hover:bg-gray-50 dark:hover:bg-gray-800 cursor-pointer"
        >
          <td class="font-medium text-gray-900 whitespace-nowrap dark:text-white">
            {{ loanData.sn }}
          </td>
          <td class="font-medium text-gray-900 whitespace-nowrap dark:text-white">
            {{ loanData.amount }}
          </td>
          <td class="font-medium text-gray-900 whitespace-nowrap dark:text-white">
            {{ loanData.status == 1 ? "Project Loan" : "Emergency Loan" }}
          </td>
          <td>
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

              <p class="whitespace-nowrap text-sm">
                {{ loanData.status }}
              </p>
            </span>
          </td>
          <td class="hidden">
            <Link
              href="#"
              class="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
            >
              View
            </Link>
          </td>
          <td class="hidden">ref_Eirvvg</td>
          <td>{{ loanData.date }}</td>
        </tr>
      </tbody>
    </table>

    <!-- <table class="min-w-full divide-y-2 bg-white text-sm">
      <thead class="ltr:text-left rtl:text-right divide-y divide-gray-200">
        <tr>
          <div class="bg-white p-5"></div>
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
    </table> -->
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
