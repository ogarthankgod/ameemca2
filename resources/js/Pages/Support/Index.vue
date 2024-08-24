<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SupportLayout from "./SupportLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import { Head, Link, usePage } from "@inertiajs/vue3";

defineOptions({
  layout: SupportLayout,
});

import {
  MdMarkemailunreadRound,
  SiMinutemailer,
  BiBarChartLineFill,
  MdCategorySharp,
  BiEnvelopePlusFill,
  HiSolidInboxIn,
  FcSupport,
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
</script>

<template>
  <Head title="Support Messages" />

  <Link v-for="categoryx in categories" :keys="categoryx" :href="`${categoryx}`">
    <div class="flex gap-3 border border-gray-200 rounded-lg p-2 mb-2">
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
            RE: How do i repay bulk loan on my account using a..
          </span>
        </p>
        <p>
          <span class="text-sm text-gray-700">
            I have been trying to make a transaction to the app and it has been showing a
            failed alert...
          </span>
        </p>
        <p class="text-xs text-gray-500 mt-1">
          <span>25 mins ago.</span>
        </p>
      </div>
    </div>
  </Link>
</template>
