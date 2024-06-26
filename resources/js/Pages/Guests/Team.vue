<script setup>
import { Head, Link } from "@inertiajs/vue3";
import Header from "./Header.vue";

import president from "./Images/team/president.png";
import vicepresident from "./Images/team/vicepresident.jpg";
import gensec from "./Images/team/gensec.jpg";
import agensec from "./Images/team/agensec.jpg";
import finsec from "./Images/team/finsec.jpg";
import treasurer from "./Images/team/treasurer.png";
import exmember1 from "./Images/team/exmember1.png";
import exmember2 from "./Images/team/exmember2.jpg";
import adhocmember1 from "./Images/team/adhocmember1.png";
import adhocmember2 from "./Images/team/adhocmember2.jpg";

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
});

const teams =[
    {
        id:1,
        name:'Ngozi Fowowe',
        position:'President',
        image:president,
        quote:'"Teamwork makes the dream work." - John C. Maxwell'
    },
    {
        id:1,
        name:'Chike Udolisa',
        position:'Vice President',
        image:vicepresident,
        quote:'"Many hands make light work." – John Heywood'
    },
    {
        id:1,
        name:'Idris Emmanuel',
        position:'General Secretary',
        image:gensec,
        quote:'"Unity is strength." – Aesop'
    },
    {
        id:1,
        name:'Amaka Ajiboye',
        position:'Assistant Genaral Secretary',
        image:agensec,
        quote:'"We rise by lifting others." – Robert Ingersoll'
    },
    {
        id:1,
        name:'Joseph Atul',
        position:'Financial Secretary',
        image:finsec,
        quote:'"In union, there is strength." – Aesop'
    },
    {
        id:1,
        name:'Adaku Ejeckam',
        position:'Treasurer',
        image:treasurer,
        quote:'"A successful team beats with one heart." – Unknown'
    },
    {
        id:1,
        name:'Ifueko Obaseki',
        position:'Ex-Officio Member',
        image:exmember1,
        quote:'"Together, we can do so much." – Helen Keller'
    },
    {
        id:1,
        name:'Ahueyi Ode',
        position:'Ex-Officio Member',
        image:exmember2,
        quote:'"A successful team beats with one heart." – Unknown'
    },
    {
        id:1,
        name:'Chinasa Anyanwu',
        position:'Lagos Consulate Liason Member',
        image:adhocmember1,
        quote:'"Teamwork makes the dream a reality." – John C. Maxwell'
    },
    {
        id:1,
        name:'Ikenna Awa',
        position:'Ad-hoc Member',
        image:adhocmember2,
        quote:'"We are stronger together." – Walter Payton'
    }
]
</script>

<template>
    <Head title="Team" />
    <Header></Header>

    <section class="bg-white text-gray-600 body-font">
        <div class="container px-5 pb-24 pt-12 mx-auto">
            <div class="flex flex-col text-center w-full mb-20">
                <h1
                    class="text-4xl font-medium title-font mb-5 text-gray-900 tracking-widest"
                >
                    OUR TEAM
                </h1>
                <p class="lg:w-2/3 mx-auto leading-relaxed text-base mt-3 p-3">
                "Teamwork is the ability to work together toward a common vision. The ability to direct individual accomplishments toward organizational objectives. It is the fuel that allows common people to attain uncommon results." -  Andrew Carnegie
                </p>
            </div>
            <div class="flex flex-wrap">
                <div class="w-full lg:w-5/12 border rounded-md p-5 mb-5 mx-auto" v-for="team in teams">
                    <div
                        class="h-full flex sm:flex-row flex-col items-center sm:justify-start justify-center text-center sm:text-left"
                    >
                        <img
                            alt="team"
                            class="flex-shrink-0 rounded-lg w-48 h-48 object-cover object-center sm:mb-0 mb-4"
                            :src="team.image"
                        />
                        <div class="flex-grow sm:pl-8">
                            <h2
                                class="title-font font-medium text-lg text-gray-900"
                            >
                                {{ team.name }}
                            </h2>
                            <h3 class="text-gray-500 mb-3">{{ team.position }}</h3>
                            <p class="mb-4 text-sm">
                            {{ team.quote }}
                            </p>
                            <span class="inline-flex mb-3">
                                <a class="text-gray-500">
                                    <svg
                                        fill="none"
                                        stroke="currentColor"
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
                                </a>
                                <a class="ml-2 text-gray-500">
                                    <svg
                                        fill="none"
                                        stroke="currentColor"
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
                                </a>
                                <a class="ml-2 text-gray-500">
                                    <svg
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        class="w-5 h-5"
                                        viewBox="0 0 24 24"
                                    >
                                        <path
                                            d="M21 11.5a8.38 8.38 0 01-.9 3.8 8.5 8.5 0 01-7.6 4.7 8.38 8.38 0 01-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 01-.9-3.8 8.5 8.5 0 014.7-7.6 8.38 8.38 0 013.8-.9h.5a8.48 8.48 0 018 8v.5z"
                                        ></path>
                                    </svg>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>

                <p class="mt-10 lg:w-2/3 mx-auto leading-relaxed text-base p-5 text-center">
                    African Proverb: "If you want to go fast, go alone. If you want to go far, go together."
                </p>
            </div>
        </div>
    </section>
</template>
