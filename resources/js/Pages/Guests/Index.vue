<script setup>
    import Header from "./Header.vue";
    import { Link } from "@inertiajs/vue3";
    // import image1 from "./Images/art/savings.jpg";
    // import image2 from "./Images/art/800px-Money_saving_growth.jpg";
    // import image3 from "./Images/art/gross-pension-contribution.jpg";
    import image4 from "./Images/art/handshake.png";
    // import image5 from "./Images/art/money-grow.jpg";
    // import image6 from "./Images/art/moneygrow.jpg";
    // import image7 from "./Images/art/return_on_investment.jpg";
    import vision from "./Images/art/vision.svg";
    import Logo from "@/Components/Logo.vue";
</script>

<template>
    <Header></Header>

    <main class="mt-2">
        <article class="">
            <section
                class="bg-white dark:bg-gray-900 border-t border-red-500 mt-1"
            >
                <div
                    class="grid max-w-screen-xl px-4 py-8 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12"
                >
                    <div
                        class="mr-auto place-self-center lg:col-span-7 sm:pl-4"
                    >
                        <h1
                            class="max-w-2xl mb-6 text-5xl font-extrabold tracking-tight leading-none md:text-6xl xl:text-7xl dark:text-white"
                        >
                            Make Your Savings Count ...
                        </h1>
                        <div
                            class="pl-8 mt-7 max-w-2xl mb-7 font-light text-gray-500 lg:mb-8 md:text-1xl lg:text-1xl dark:text-gray-400"
                        >
                            <ol
                                class="relative text-gray-500 border-s border-gray-200 dark:border-gray-700 dark:text-gray-400"
                            >
                                <li class="mb-10 ms-6">
                                    <span
                                        class="absolute flex items-center justify-center w-8 h-8 bg-green-200 rounded-full -start-4 ring-4 ring-white dark:ring-gray-900 dark:bg-green-900"
                                    >
                                        <svg
                                            class="w-3.5 h-3.5 text-green-500 dark:text-green-400"
                                            aria-hidden="true"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 16 12"
                                        >
                                            <path
                                                stroke="currentColor"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M1 5.917 5.724 10.5 15 1.5"
                                            />
                                        </svg>
                                    </span>
                                    <h3 class="font-medium leading-tight">
                                        AMEEMCA Cooperative offers members an
                                        opportunity to save and access low
                                        interest loans.
                                    </h3>
                                </li>
                                <li class="mb-10 ms-6">
                                    <span
                                        class="absolute flex items-center justify-center w-8 h-8 bg-green-200 rounded-full -start-4 ring-4 ring-white dark:ring-gray-900 dark:bg-gray-700"
                                    >
                                        <svg
                                            class="w-3.5 h-3.5 text-green-500 dark:text-green-400"
                                            aria-hidden="true"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 16 12"
                                        >
                                            <path
                                                stroke="currentColor"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M1 5.917 5.724 10.5 15 1.5"
                                            />
                                        </svg>
                                    </span>
                                    <h3 class="font-medium leading-tight">
                                        Embracing a culture of saving increases
                                        your ability to invest in the future and
                                        enjoy significant returns.
                                    </h3>
                                </li>
                                <li class="mb-10 ms-6">
                                    <span
                                        class="absolute flex items-center justify-center w-8 h-8 bg-green-200 rounded-full -start-4 ring-4 ring-white dark:ring-gray-900 dark:bg-gray-700"
                                    >
                                        <svg
                                            class="w-3.5 h-3.5 text-green-500 dark:text-green-400"
                                            aria-hidden="true"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 16 12"
                                        >
                                            <path
                                                stroke="currentColor"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M1 5.917 5.724 10.5 15 1.5"
                                            />
                                        </svg>
                                    </span>
                                    <h3 class="font-medium leading-tight">
                                        Hence, our zeal to pool resources
                                        together, identify common goals and work
                                        diligently towards its achievement.
                                    </h3>
                                </li>
                            </ol>
                        </div>

                        <Link
                            :href="route('membership.index')"
                            class="inline-flex items-center justify-center px-5 py-3 mr-3 text-base font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-900"
                        >
                            Get started
                            <svg
                                class="w-5 h-5 ml-2 -mr-1"
                                fill="currentColor"
                                viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg"
                            >
                                <path
                                    fill-rule="evenodd"
                                    d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                                    clip-rule="evenodd"
                                ></path>
                            </svg>
                        </Link>
                        <Link
                            :href="route('login')"
                            class="inline-flex items-center justify-center px-5 py-3 text-base font-medium text-center text-gray-900 border border-gray-300 rounded-lg hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 dark:text-white dark:border-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-800"
                        >
                            Login
                        </Link>
                    </div>

                    <div
                        class="items-center mt-16 md:mt-10 lg:col-span-5 lg:flex"
                    >
                        <img :src="image4" alt="mockup" class="h-fit" />
                    </div>
                </div>
            </section>

            <section class="text-gray-600 body-font">
                <div
                    class="container max-w-screen-xl mx-auto flex px-5 py-24 md:flex-row flex-col items-center"
                >
                    <div
                        class="lg:max-w-lg lg:w-full md:w-1/2 w-5/6 lg:pr-24 md:pr-16"
                    >
                        <img
                            class="object-cover object-center rounded"
                            alt="hero"
                            :src="vision"
                        />
                    </div>
                    <div
                        class="lg:flex-grow md:w-1/ flex flex-col md:items-start md:text-left mb-16 md:mb-0 items-center text-center"
                    >
                        <h1
                            class="title-font sm:text-4xl text-7xl mb-4 font-bold text-gray-900"
                        >
                            Vision <br class="hidden lg:inline-block" />...
                        </h1>
                        <p class="mb-8 leading-relaxed">
                            To harness the resources of its members and foster a
                            strong financial independence through prudent
                            investments and sound financial management for the
                            benefit of members.
                        </p>
                        <div class="flex justify-center">
                            <Link
                                :href="route('membership.index')"
                                class="rounded-lg inline-flex text-white bg-primary-700 border-0 py-2 px-6 focus:outline-none hover:bg-primary-800 text-1xl items-center"
                            >
                                Join us today
                                <svg
                                    class="w-5 h-5 ml-2 -mr-1"
                                    fill="currentColor"
                                    viewBox="0 0 20 20"
                                    xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                        fill-rule="evenodd"
                                        d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                                        clip-rule="evenodd"
                                    ></path>
                                </svg>
                            </Link>
                        </div>
                    </div>
                </div>
            </section>

            <section class="text-gray-600 body-font bg-white">
                <div class="container px-5 pb-24 pt-10 mx-auto">
                    <div class="flex flex-col text-center w-full mb-20">
                        <h2
                            class="text-sm text-primary-500 tracking-widest font-medium title-font mb-1"
                        >
                            More About Us?
                        </h2>
                        <h1
                            class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900"
                        ></h1>
                        <p class="lg:w-2/3 mx-auto leading-relaxed text-base">
                            Discover the origins of AMEEMCA Cooperative, our
                            mission, vision, and the core values that drive us.
                            Learn about our journey and how we strive to empower
                            our members through collaborative financial
                            solutions and a culture of saving.
                        </p>
                    </div>
                    <div class="flex flex-wrap">
                        <div
                            class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60"
                        >
                            <h2
                                class="text-1xl sm:text-xl text-gray-900 font-medium title-font mb-2"
                            >
                                Why Join AMEEMCA?
                            </h2>
                            <p class="leading-relaxed text-base mb-4">
                                Explore the numerous benefits of becoming a
                                member of AMEEMCA Cooperative. From low-interest
                                loans and investment opportunities to
                                educational resources and community support, see
                                how membership can enhance your financial
                                well-being.
                            </p>
                            <Link
                                :href="route('membership.index')"
                                class="text-primary-500 inline-flex items-center"
                            >
                                Learn More
                                <svg
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    class="w-4 h-4 ml-2"
                                    viewBox="0 0 24 24"
                                >
                                    <path d="M5 12h14M12 5l7 7-7 7"></path>
                                </svg>
                            </Link>
                        </div>
                        <div
                            class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60"
                        >
                            <h2
                                class="text-1xl sm:text-xl text-gray-900 font-medium title-font mb-2"
                            >
                                Accessible Low-Interest Loans
                            </h2>
                            <p class="leading-relaxed text-base mb-4">
                                Learn about our low-interest loan products
                                tailored to meet your needs. Whether you need
                                funds for personal, educational, or business
                                purposes, our loans are designed to provide
                                financial support with manageable repayment
                                terms.
                            </p>
                            <Link
                                :href="route('membership.index')"
                                class="text-primary-500 inline-flex items-center"
                            >
                                Learn More
                                <svg
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    class="w-4 h-4 ml-2"
                                    viewBox="0 0 24 24"
                                >
                                    <path d="M5 12h14M12 5l7 7-7 7"></path>
                                </svg>
                            </Link>
                        </div>
                        <div
                            class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60"
                        >
                            <h2
                                class="text-1xl sm:text-xl text-gray-900 font-medium title-font mb-2"
                            >
                                Grow Your Wealth
                            </h2>
                            <p class="leading-relaxed text-base mb-4">
                                Discover investment opportunities available to
                                our members. From short-term investments to
                                long-term growth strategies, see how pooling
                                resources with AMEEMCA can lead to significant
                                financial returns and a more secure future.
                            </p>
                            <Link
                                :href="route('membership.index')"
                                class="text-primary-500 inline-flex items-center"
                            >
                                Learn More
                                <svg
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    class="w-4 h-4 ml-2"
                                    viewBox="0 0 24 24"
                                >
                                    <path d="M5 12h14M12 5l7 7-7 7"></path>
                                </svg>
                            </Link>
                        </div>
                        <div
                            class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60"
                        >
                            <h2
                                class="text-1xl sm:text-xl text-gray-900 font-medium title-font mb-2"
                            >
                                Building Stronger Communities
                            </h2>
                            <p class="leading-relaxed text-base mb-4">
                                Learn about our community initiatives and social
                                responsibility programs. See how AMEEMCA
                                Cooperative gives back to the community through
                                various projects aimed at improving lives and
                                fostering sustainable development.
                            </p>
                            <Link
                                :href="route('membership.index')"
                                class="text-primary-500 inline-flex items-center"
                            >
                                Learn More
                                <svg
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    class="w-4 h-4 ml-2"
                                    viewBox="0 0 24 24"
                                >
                                    <path d="M5 12h14M12 5l7 7-7 7"></path>
                                </svg>
                            </Link>
                        </div>
                    </div>
                    <Link
                        as="button"
                        :href="route('membership.index')"
                        class="flex mx-auto mt-16 text-white bg-primary-500 border-0 py-2 px-8 focus:outline-none hover:bg-primary-600 rounded text-1xl"
                    >
                        JOIN US TODAY</Link
                    >
                </div>
            </section>

            <span class="flex items-center">
                <span class="h-px flex-1 bg-black"></span>
                <span class="shrink-0 px-6">Know More!</span>
                <span class="h-px flex-1 bg-black"></span>
            </span>

            <section class="text-gray-600 body-font">
                <div class="container px-5 py-24 mx-auto">
                    <h1
                        class="sm:text-2xl text-2xl font-medium title-font text-center text-gray-900 mb-20"
                    >
                        "Great things in business are never done by one person."
                        – Steve Jobs <br class="hidden sm:block" />...
                    </h1>
                    <div
                        class="flex flex-wrap sm:-m-4 -mx-4 -mb-10 -mt-4 md:space-y-0 space-y-6"
                    >
                        <div class="p-4 md:w-1/2 flex">
                            <div
                                class="w-12 h-12 inline-flex items-center justify-center rounded-full bg-indigo-100 text-indigo-500 mb-4 flex-shrink-0"
                            >
                                <svg
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    class="w-6 h-6"
                                    viewBox="0 0 24 24"
                                >
                                    <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
                                </svg>
                            </div>
                            <div class="flex-grow pl-6">
                                <h2
                                    class="text-gray-900 text-1xl title-font font-medium mb-2"
                                >
                                    News & Updates
                                </h2>
                                <p class="leading-relaxed text-base">
                                    Keep up to date with the latest news,
                                    updates, and events at Camea Cooperative.
                                    Find out about upcoming meetings, new
                                    product launches, and important
                                    announcements that affect our members.
                                </p>
                                <a
                                    class="mt-3 text-indigo-500 inline-flex items-center"
                                    >Learn More
                                    <svg
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        class="w-4 h-4 ml-2"
                                        viewBox="0 0 24 24"
                                    >
                                        <path d="M5 12h14M12 5l7 7-7 7"></path>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div class="p-4 md:w-1/2 flex">
                            <div
                                class="w-12 h-12 inline-flex items-center justify-center rounded-full bg-indigo-100 text-indigo-500 mb-4 flex-shrink-0"
                            >
                                <svg
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    stroke-width="2"
                                    class="w-6 h-6"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"
                                    ></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                            </div>
                            <div class="flex-grow pl-6">
                                <h2
                                    class="text-gray-900 text-1xl title-font font-medium mb-2"
                                >
                                    Get in Touch
                                </h2>
                                <p class="leading-relaxed text-base">
                                    Have questions or need assistance? Contact
                                    our friendly support team for help with
                                    membership, loan applications, savings
                                    plans, and more. We're here to support you
                                    every step of the way.
                                </p>
                                <Link
                                    class="mt-3 text-indigo-500 inline-flex items-center"
                                    :href="route('register')"
                                >
                                    Get In Touch
                                    <svg
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        class="w-4 h-4 ml-2"
                                        viewBox="0 0 24 24"
                                    >
                                        <path d="M5 12h14M12 5l7 7-7 7"></path>
                                    </svg>
                                </Link>
                            </div>
                        </div>
                        <div class="p-4 md:w-1/2 mx-auto flex">
                            <div
                                class="w-12 h-12 inline-flex items-center justify-center rounded-full bg-indigo-100 text-indigo-500 mb-4 flex-shrink-0"
                            >
                                <svg
                                    width="800px"
                                    height="800px"
                                    viewBox="0 0 24 24"
                                    fill="red"
                                    xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        d="M12 2.75C6.89137 2.75 2.75 6.89137 2.75 12C2.75 17.1086 6.89137 21.25 12 21.25C17.1086 21.25 21.25 17.1086 21.25 12C21.25 6.89137 17.1086 2.75 12 2.75ZM1.25 12C1.25 6.06294 6.06294 1.25 12 1.25C17.9371 1.25 22.75 6.06294 22.75 12C22.75 17.9371 17.9371 22.75 12 22.75C6.06294 22.75 1.25 17.9371 1.25 12ZM12 7.75C11.3787 7.75 10.875 8.25368 10.875 8.875C10.875 9.28921 10.5392 9.625 10.125 9.625C9.71079 9.625 9.375 9.28921 9.375 8.875C9.375 7.42525 10.5503 6.25 12 6.25C13.4497 6.25 14.625 7.42525 14.625 8.875C14.625 9.83834 14.1056 10.6796 13.3353 11.1354C13.1385 11.2518 12.9761 11.3789 12.8703 11.5036C12.7675 11.6246 12.75 11.7036 12.75 11.75V13C12.75 13.4142 12.4142 13.75 12 13.75C11.5858 13.75 11.25 13.4142 11.25 13V11.75C11.25 11.2441 11.4715 10.8336 11.7266 10.533C11.9786 10.236 12.2929 10.0092 12.5715 9.84439C12.9044 9.64739 13.125 9.28655 13.125 8.875C13.125 8.25368 12.6213 7.75 12 7.75ZM12 17C12.5523 17 13 16.5523 13 16C13 15.4477 12.5523 15 12 15C11.4477 15 11 15.4477 11 16C11 16.5523 11.4477 17 12 17Z"
                                        fill="#1C274C"
                                    />
                                </svg>
                            </div>
                            <div class="flex-grow pl-6">
                                <h2
                                    class="text-gray-900 text-1xl title-font font-medium mb-2"
                                >
                                    Got Questions?
                                </h2>
                                <p class="leading-relaxed text-base">
                                    Find answers to commonly asked questions
                                    about AMEEMCA Cooperative. Whether you need
                                    information on how to join, how to apply for
                                    a loan, or details about our savings plans,
                                    our FAQ section provides clear and concise
                                    answers.
                                </p>
                                <Link
                                    :href="route('faq.index')"
                                    class="mt-3 text-indigo-500 inline-flex items-center"
                                >
                                    FAQ
                                    <svg
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        class="w-4 h-4 ml-2"
                                        viewBox="0 0 24 24"
                                    >
                                        <path d="M5 12h14M12 5l7 7-7 7"></path>
                                    </svg>
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </article>
    </main>

    <footer class="text-gray-600 body-font border border-red-800">
        <div class="container px-5 mx-auto"></div>
        <div class="bg-gray-100">
            <div
                class="container px-5 py-3 mx-auto flex items-center sm:flex-row flex-col"
            >
                <Link
                    href=""
                    class="flex title-font font-medium items-center md:justify-start justify-center text-gray-900"
                >
                    <Logo />
                    <span class="ml-3 text-xl"></span>
                </Link>
                <p class="text-sm text-gray-500 sm:ml-6 sm:mt-0 mt-4">
                    © 2020 - 2024 Ameemca..
                </p>
                <span
                    class="inline-flex sm:ml-auto sm:mt-0 mt-4 justify-center sm:justify-start"
                >
                    <Link href="" class="text-gray-500">
                        <svg
                            fill="currentColor"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            class="w-5 h-5"
                            viewBox="0 0 24 24"
                        >
                            <path
                                d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"
                            ></path>
                        </svg>
                    </Link>
                    <Link
                        :href="route('guest.index')"
                        class="ml-3 text-gray-500"
                    >
                        <svg
                            fill="currentColor"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            class="w-5 h-5"
                            viewBox="0 0 24 24"
                        >
                            <path
                                d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z"
                            ></path>
                        </svg>
                    </Link>
                    <Link href="" class="ml-3 text-gray-500">
                        <svg
                            fill="none"
                            stroke="currentColor"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            class="w-5 h-5"
                            viewBox="0 0 24 24"
                        >
                            <rect
                                width="20"
                                height="20"
                                x="2"
                                y="2"
                                rx="5"
                                ry="5"
                            ></rect>
                            <path
                                d="M16 11.37A4 4 0 1112.63 8 4 4 0 0116 11.37zm1.5-4.87h.01"
                            ></path>
                        </svg>
                    </Link>
                    <Link href="" class="ml-3 text-gray-500">
                        <svg
                            fill="currentColor"
                            stroke="currentColor"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="0"
                            class="w-5 h-5"
                            viewBox="0 0 24 24"
                        >
                            <path
                                stroke="none"
                                d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6zM2 9h4v12H2z"
                            ></path>
                            <circle cx="4" cy="4" r="2" stroke="none"></circle>
                        </svg>
                    </Link>
                </span>
            </div>
        </div>
    </footer>
</template>
