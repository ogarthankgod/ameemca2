<script setup>
import { Head, Link } from "@inertiajs/vue3";
import Header from "./Header.vue";
import platinumIcon from "./Images/art/diamond-svgrepo-com.svg";


defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
});

const packages = [
{
        id:1,
        fee_type:'Registration',
        name:'Platinum',
        price:'N50,000',
        icon:platinumIcon,
        benefits:[
            {id:1,benefit:'5% interest rates annually on loans.',showCheck:true},
            {id:2, benefit:'Access project loan up to 200% of net savings.',showCheck:true},
            {id:3,benefit:'Loan tenure up to 60 months.',showCheck:true},
            {id:4,benefit:'Bonus & gifts provided annually.',showCheck:true},
            {id:5,benefit:'...',showCheck:false}
        ],
    },
    {
        id:2,
        fee_type:'Registration',
        name:'Diamond',
        price:'N50,000',
        icon:platinumIcon,
        benefits:[
            {id:1,benefit:'1.5 - 2.5% Management Fees on loans.',showCheck:true},
            {id:2, benefit:'Access project loan up to 150% of net savings.',showCheck:true},
            {id:3,benefit:'Loan tenure up to 24 months.',showCheck:true},
            {id:4,benefit:'Gifts provided annually.',showCheck:true},
            {id:5,benefit:'No bonus / dividends.',showCheck:true},
        ],
    },
    {
        id:1,
        fee_type:'Registration',
        name:'Contractor',
        price:'N50,000',
        icon:platinumIcon,
        benefits:[
            {id:1,benefit:'1.5 - 2.5% Management Fees on loans.',showCheck:true},
            {id:2, benefit:'Access project loan up to 100% of net savings.',showCheck:true},
            {id:3,benefit:'Loan tenure up to 48 months.',showCheck:true},
            {id:4,benefit:'Bonus & gifts provided annually.',showCheck:true},
            {id:5,benefit:'No bonus / dividends.',showCheck:true},
        ],
    },
    // {
    //     id:1,
    //     fee_type:'Registration',
    //     name:'Elite',
    //     price:'N50,000',
          //  icon:platinumIcon,
    //     benefits:[
    //         {id:1,benefit:' 1.0 - 2.0% Management fees on loan.',showCheck:true},
    //         {id:2, benefit:'Access project loan up to 100% of net savings.',showCheck:true},
    //         {id:3,benefit:'Loan tenure up to 24 months.',showCheck:true},
    //         {id:4,benefit:'Bonus & gifts provided annually.',showCheck:true}
    //     ],
    // },
];
</script>

<template>
    <Head title="Vision" />
    <Header></Header>

  <div class="mt-5 max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8 lg:py-16 mx-auto">
    <div class="text-center mb-14">
        <p class="font-bold text-4xl text-primary-950">Membership Packages</p>
        <p class="mt-5 font-medium text-md text-gray-700">In One Click Choose Your Package.</p>
    </div>

    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:items-stretch md:grid-cols-3 md:gap-8">

      <div class="divide-y divide-gray-200 rounded-2xl border border-gray-200 shadow-sm" v-for="mPackage in packages" :key="mPackage.id">
        <div class="p-6 sm:px-8">
          <h2 class="text-4xl font-bold text-gray-900">
            <img :src="mPackage.icon" class="inline w-8"/> {{ mPackage.name }}
            <span class="sr-only">package</span>
          </h2>
  
          <p class="mt-7 text-gray-700">{{ mPackage.fee_type }} fee</p>
  
          <p class="mt-0 sm:mt-0">
            <strong class="text-2xl font-bold text-gray-900 sm:text-4xl"> {{ mPackage.price }} </strong>
  
            <small class="text-sm font-small text-gray-700">/one time fee</small>
          </p>
        </div>
        <div class="p-6 sm:px-8">
          <p class="text-lg font-medium text-gray-900 sm:text-xl">Package Benefits:</p>
  
          <ul class="mt-2 space-y-2 sm:mt-4" v-for="benefit in mPackage.benefits" :key="benefit.id">
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
                v-if="benefit.showCheck"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700 text-sm">{{ benefit.benefit }}</span>
            </li>
            
          </ul>

          <Link
            class="mt-4 block rounded border border-indigo-600 bg-indigo-600 px-12 py-3 text-center text-sm font-medium text-white hover:bg-transparent hover:text-indigo-600 focus:outline-none focus:ring active:text-indigo-500 sm:mt-6"
            :href="route('register', `${mPackage.id}`)"
          >
            Get Started
          </Link>
        </div>
      </div>

<!--   
      <div class="divide-y divide-gray-200 rounded-2xl border border-gray-200 shadow-sm">
        <div class="p-6 sm:px-8">
          <h2 class="text-lg font-medium text-gray-900">
            Pro
            <span class="sr-only">Plan</span>
          </h2>
  
          <p class="mt-2 text-gray-700">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
  
          <p class="mt-2 sm:mt-4">
            <strong class="text-3xl font-bold text-gray-900 sm:text-4xl"> 30$ </strong>
  
            <span class="text-sm font-medium text-gray-700">/month</span>
          </p>
  
          <a
            class="mt-4 block rounded border border-indigo-600 bg-indigo-600 px-12 py-3 text-center text-sm font-medium text-white hover:bg-transparent hover:text-indigo-600 focus:outline-none focus:ring active:text-indigo-500 sm:mt-6"
            href="#"
          >
            Get Started
          </a>
        </div>
  
        <div class="p-6 sm:px-8">
          <p class="text-lg font-medium text-gray-900 sm:text-xl">What's included:</p>
  
          <ul class="mt-2 space-y-2 sm:mt-4">
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> 20 users </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> 5GB of storage </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> Email support </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> Help center access </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-red-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
  
              <span class="text-gray-700"> Phone support </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-red-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
  
              <span class="text-gray-700"> Community access </span>
            </li>
          </ul>
        </div>
      </div>
  
      <div class="divide-y divide-gray-200 rounded-2xl border border-gray-200 shadow-sm">
        <div class="p-6 sm:px-8">
          <h2 class="text-lg font-medium text-gray-900">
            Enterprise
            <span class="sr-only">Plan</span>
          </h2>
  
          <p class="mt-2 text-gray-700">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
  
          <p class="mt-2 sm:mt-4">
            <strong class="text-3xl font-bold text-gray-900 sm:text-4xl"> 100$ </strong>
  
            <span class="text-sm font-medium text-gray-700">/month</span>
          </p>
  
          <a
            class="mt-4 block rounded border border-indigo-600 bg-indigo-600 px-12 py-3 text-center text-sm font-medium text-white hover:bg-transparent hover:text-indigo-600 focus:outline-none focus:ring active:text-indigo-500 sm:mt-6"
            href="#"
          >
            Get Started
          </a>
        </div>
  
        <div class="p-6 sm:px-8">
          <p class="text-lg font-medium text-gray-900 sm:text-xl">What's included:</p>
  
          <ul class="mt-2 space-y-2 sm:mt-4">
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> 50 users </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> 20GB of storage </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> Email support </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> Help center access </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> Phone support </span>
            </li>
  
            <li class="flex items-center gap-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5 text-indigo-700"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
  
              <span class="text-gray-700"> Community access </span>
            </li>
          </ul>
        </div>
      </div> -->
    </div>
  </div>
</template>
