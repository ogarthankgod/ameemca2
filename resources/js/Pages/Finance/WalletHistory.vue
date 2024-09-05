<script setup>
import { Link } from "@inertiajs/vue3";
</script>
<template>
  <div class="space-y-4 mb-20">
    <details class="group [&_summary::-webkit-details-marker]:hidden" open>
      <summary
        class="flex cursor-pointer items-center justify-between gap-1.5 rounded-lg bg-white p-4 text-gray-900"
      >
        <h2 class="font-bold">Wallet History</h2>

        <svg
          class="size-5 shrink-0 transition duration-300 group-open:-rotate-180"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M19 9l-7 7-7-7"
          />
        </svg>
      </summary>

      <section class="mt-4 leading-relaxed text-gray-700">
        <!-- Wallet History Table Here -->
        <div class="rounded-lg border border-gray-200">
          <div class="overflow-x-scroll rounded-t-lg">
            <table class="min-w-full w-full divide-y-2 bg-white text-sm">
              <thead class="">
                <tr>
                  <th class="px-2 py-2 font-medium text-gray-900">SN</th>
                  <th class="px-2 py-2 font-medium text-gray-900">Name</th>
                  <th class="px-2 py-2 font-medium text-gray-900">Trans. Type</th>
                  <th class="px-2 py-2 font-medium text-gray-900">Amount</th>
                  <th class="px-2 py-2 font-medium text-gray-900">Currency</th>
                  <th class="px-2 py-2 font-medium text-gray-900">Ref.</th>
                  <th class="px-2 py-2 font-medium text-gray-900">Status</th>
                  <th class="px-2 py-2 font-medium text-gray-900">Date</th>
                  <th class="px-2 py-2 font-medium text-gray-900">Actions</th>
                </tr>
              </thead>

              <tbody class="divide-y divide-gray-200">
                <tr>
                  <td class="px-2 py-2 font-medium text-gray-900">1</td>
                  <td class="px-2 py-2 font-medium text-gray-900">John Doe</td>
                  <td class="px-2 py-2 font-medium text-gray-900">
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

                      <p class="text-sm">Withdrawal</p>
                    </span>
                  </td>
                  <td class="px-2 py-2 text-gray-700">₦1,000,000.00</td>
                  <td class="px-2 py-2 text-gray-700">₦</td>
                  <td class="px-2 py-2 text-gray-700">Tje344jfe</td>
                  <td class="px-2 py-2 text-gray-700">
                    <span
                      class="inline-flex items-center justify-center rounded-full border border-emerald-500 px-2.5 py-0.5 text-emerald-700"
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

                      <p class="text-sm">Verified</p>
                    </span>
                  </td>
                  <td class="px-2 py-2">2024-25-08</td>
                  <td class="px-2 py-2">
                    <Link
                      href="#"
                      class="inline-block rounded bg-indigo-600 px-2 py-2 text-xs font-medium text-white hover:bg-indigo-700"
                    >
                      View
                    </Link>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="rounded-b-lg border-t border-gray-200 px-2 py-2">
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
      </section>
    </details>
  </div>
</template>
