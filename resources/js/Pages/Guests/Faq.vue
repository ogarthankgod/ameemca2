<script setup>
import { Head, Link } from "@inertiajs/vue3";
import Header from "./Header.vue";

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
});

const faqs = [
    {
        question: "Who is a Platinum Member?",
        answer: "A Platinum member pays 5% per annum interest rate on project loans and can access up to 200% of their net savings balance for a tenure up to 60 months or 130 pay periods.",
        linkText: "",
        route: "membership",
    },
    {
        question: "Who is a Diamond Member?",
        answer: "A Diamond member pays 1.5% - 2.5% administrative and processing fees depending on loan tenure and can access 150% of their net savings balance for a tenure up to 24 months or 52 pay periods.",
        linkText: "",
        route: "",
    },
    {
        question: "Who is an Elite Member?",
        answer: "Elite member is a member who is no longer working with the Mission due to resignation/retirement but wants to continue as a member of the cooperative. This member pays 1.0% - 2.0% administrative and processing fees depending on loan tenure and can only access 100% of their net savings balance for a tenure up to 24 months.",
        linkText: "",
        route: "",
    },
    {
        question: "Who is a Contractor?",
        answer: "Please sign up and register with a non-refundable fee of N2,000.",
        linkText: "",
        route: "membership",
    },
    {
        question: "How do i join?",
        answer: "A Contractor is a member who is a member of the cooperative. This member pays 1.0% - 2.0% administrative and processing fees depending on loan tenure and can only access 100% of their net savings balance for a tenure up to 24 months.",
        linkText: "",
        route: "membership",
    },
    {
        question: "How do i allot my contributions?",
        answer: "Please fill an allotment form, DS-1992, upload in your user module and submit.",
        linkText: "",
        route: "membership",
    },
];
</script>

<template>
    <Head title="Vision" />
    <Header></Header>

    <div
        class="mt-5 space-y-4 max-w-lg mx-auto flex-row items-center justify-center"
    >
        <h1
            class="max-w-3xl my-8 text-xl font-bold tracking-tight leading-none dark:text-white"
        >
            FAQ's
        </h1>
        <p>Frequently Asked Questions...</p>

        <details
            class="group rounded-lg bg-gray-200 p-6 [&_summary::-webkit-details-marker]:hidden"
            v-for="faq in faqs"
        >
            <summary
                class="flex cursor-pointer items-center justify-between gap-1.5 text-gray-900"
            >
                <h2 class="font-bold text-md">
                    {{ faq.question }}
                </h2>

                <span class="relative size-5 shrink-0">
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="absolute inset-0 size-5 opacity-100 group-open:opacity-0"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        stroke-width="2"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"
                        />
                    </svg>

                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="absolute inset-0 size-5 opacity-0 group-open:opacity-100"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        stroke-width="2"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"
                        />
                    </svg>
                </span>
            </summary>

            <p class="mt-4 leading-relaxed text-gray-700 text-sm">
                {{ faq.answer }}
            </p>

            <Link
                class="mt-4 block rounded border border-indigo-600 bg-indigo-600 px-12 py-3 text-center text-sm font-medium text-white hover:bg-transparent hover:text-indigo-600 focus:outline-none focus:ring active:text-indigo-500 sm:mt-6"
                :href="route(`membership.index`)"
            >
                {{ faq.linkText?faq.linkText:'Get Started' }}
            </Link>
        </details>
    </div>
</template>
