<script setup>
import { Head, Link, usePage, useForm } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import initFlowBite from "@/Components/initFlowBite.vue";

import { FaCloudUploadAlt } from "oh-vue-icons/icons";
import { addIcons } from "oh-vue-icons";

//Importing FlowBite Components
import { onMounted, ref } from "vue";
import { initFlowbite } from "flowbite";

// initialize components based on data attribute selectors
onMounted(() => {
  initFlowbite();
});

addIcons(FaCloudUploadAlt);

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  pageState: String,
  data: Object,
});

const user = usePage().props.auth.user;

const beneficiaryForm = useForm({
  name: String,
  file: null,
});

const beneficiaryFormSubmit = () => {
  beneficiaryForm.post('route("documents")');
};
</script>

<template>
  <Head title="Other Document" />
  <SectionHead text="Other Document" />

  <div class="space-y-4 mb-20">
    <section class="mt-4 leading-relaxed text-gray-700">
      <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <div
          class="flex items-center justify-between flex-column flex-wrap md:flex-row space-y-4 md:space-y-0 p-4 bg-white dark:bg-gray-900"
        >
          <button
            id="dropdownActionButton"
            data-dropdown-toggle="dropdownAction"
            class="hidden inline-flexx items-center text-gray-500 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 font-medium rounded-lg text-sm px-3 py-1.5 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"
            type="button"
          >
            <span class="sr-only">Action button</span>
            Action
            <svg
              class="w-2.5 h-2.5 ms-2.5"
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
          <!-- Dropdown menu -->
          <div
            id="dropdownAction"
            class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600"
          >
            <div class="py-1 hidden"></div>
          </div>

          <!-- <label for="table-search" class="sr-only">Search</label> -->
          <div class="relative">
            <!--Allotment Modal toggle -->
            <button
              data-modal-target="others-modal"
              data-modal-toggle="others-modal"
              class="inline ml-5 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 mb-1"
              type="button"
            >
              Upload Other Forms
            </button>
          </div>
        </div>

        <!-- Upload Beneficiary modal -->
        <div
          id="others-modal"
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
                  Upload Other Forms/Documents
                </h3>

                <button
                  type="button"
                  class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                  data-modal-toggle="others-modal"
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
                name="allotmentUploadForm"
                id="allotmentUploadForm"
                @sumbit.prevent="beneficiaryFormSubmit"
              >
                <ul class="text-xs text-gray-600 mb-5 list-disc list-inside">
                  <li>...</li>
                </ul>

                <div class="mb-4">
                  <label
                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                    for="small_size"
                  ></label>
                  <input
                    class="block w-full mb-5 text-xs text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
                    id="small_size"
                    type="file"
                    name="file"
                  />
                </div>

                <button
                  type="submit"
                  class="text-white inline-flex items-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                >
                  <v-icon name="fa-cloud-upload-alt" class="flex-shrink-0 w-5 h-5" />

                  <span class="pl-2">Upload</span>
                </button>
              </form>
            </div>
          </div>
        </div>

        <table
          class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400"
        >
          <thead
            class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400"
          >
            <tr>
              <th scope="col" class="px-6 py-3">S/N</th>
              <th scope="col" class="px-6 py-3">Document Title</th>
              <th scope="col" class="px-6 py-3">File</th>
              <th scope="col" class="px-6 py-3">Action</th>
            </tr>
          </thead>
          <tbody>
            <tr
              class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700"
            >
              <th
                scope="row"
                class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
              >
                1
              </th>
              <td class="px-6 py-4">Other Documents</td>
              <td class="px-6 py-4">
                <span
                  class="cursor-pointer inline-flex items-center justify-center rounded-full border border-emerald-500 px-2.5 py-0.5 text-emerald-700"
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

                  <p class="text-sm">Download</p>
                </span>
              </td>
              <td class="px-6 py-4">
                <Link
                  href="#"
                  class="hidden inline-blockx rounded bg-indigo-600 px-2 py-2 text-xs font-medium text-white hover:bg-indigo-700"
                >
                  Download
                </Link>

                <a
                  href="#"
                  class="font-medium text-blue-600 dark:text-blue-500 hover:underline"
                  >Edit</a
                >
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>
  </div>
</template>
