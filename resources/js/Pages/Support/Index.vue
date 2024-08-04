<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import { Head, Link, usePage } from "@inertiajs/vue3";

import {
    MdMarkemailunreadRound,
    SiMinutemailer,
    BiBarChartLineFill,
    MdCategorySharp,
    BiEnvelopePlusFill,
    HiSolidInboxIn,
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

const categories = ["Account", "Loan", "Payment", "Video", "Investment"];
</script>

<template>
    <Head title="Support" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Support
            </h2>
        </template>

        <section class="flex-col w-full mb-6">
            <div
                class="flex flex-col sm:flex-row space-x-0 sm:space-x-3 mb-0 w-full"
            >
                <div
                    class="sm:grid grid-cols-1 sm:grid-cols-2 gap-4 mb-7 w-full space-y-2 sm:space-y-0"
                >
                    <!-- New Emails -->
                    <div
                        class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3"
                    >
                        <div class="bg-red-100 p-3 rounded-full">
                            <v-icon
                                name="si-minutemailer"
                                class="flex-shrink-0 w-5 h-5 text-red-500"
                            />
                        </div>
                        <div>
                            <p class="text-md text-black">2,100</p>
                            <p class="text-xs font-bold">New Emails</p>
                        </div>
                    </div>

                    <!-- Unread Emails -->
                    <div
                        class="bg-white p-2 rounded-lg shadow-sm flex items-center space-x-3"
                    >
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
                    <div
                        class="bg-teal-100 flex p-2 mb-2 justify-center items-center"
                    >
                        <v-icon
                            name="md-category-sharp"
                            class="text-teal-500 flex-shrink-0 w-4"
                        />
                        <p class="text-xs font-bold pl-3">Categories</p>
                    </div>

                    <div class="px-2 pb-2">
                        <!-- Category - Outlined -->
                        <span
                            v-for="category in categories"
                            class="inline-flex items-center justify-center rounded-full border border-purple-500 px-2.5 py-0.5 text-purple-700 m-[2px] hover:bg-purple-500 hover:text-white"
                        >
                            <p class="whitespace-nowrap text-xs">
                                {{ category }}
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
                            <span class="px-1 text-sm sm:text-base"
                                >Unread</span
                            >
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
                    <div class="flex gap-3 border border-gray-200  rounded-lg p-2 mb-2" v-for="categoryx in categories">
                        <div class="w-fit p-4">
                            <img
                                src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                                alt=""
                                class="w-16"
                            />
                        </div>
                        <div class="">
                            <p>
                                <span class="text-slate-400 text-sm mb-1 capitalize">
                                    Jacob Maintenence: 210983
                                </span>
                            </p>
                            <p>
                                <span class="font-bold text-sm mb-2 uppercase">
                                    RE: How do i repay bulk loan on my account
                                    using a..
                                </span>
                            </p>
                            <p>
                                <span class="text-sm text-gray-700">
                                    I have been trying to make a transaction to
                                    the app and it has been showing a failed
                                    alert...
                                </span>
                            </p>
                            <p class="text-xs text-gray-500 mt-1">
                                <span>25 mins ago.</span>
                            </p>
                        </div>
                    </div>


                </div>
            </section>

            <article
                class="rounded-lg border border-gray-100 bg-white p-6 shadow-sm"
            >
                <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div class="p-6 text-gray-900">Messages!</div>
                </div>
            </article>
        </section>
    </AuthenticatedLayout>
</template>
