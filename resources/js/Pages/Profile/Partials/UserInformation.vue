<script setup>
import DangerButton from "@/Components/DangerButton.vue";
import SecondaryButton from "@/Components/SecondaryButton.vue";
import { usePage } from "@inertiajs/vue3";

const user = usePage().props.auth.user;
</script>

<template>
  <section class="space-y-6">
    <div class="flow-root">
      <dl class="-my-3 divide-y divide-gray-100 text-sm">
        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Name</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.fullname }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Staff ID</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.staffid }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Email</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.email }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Secondary Email</dt>
          <dd class="sm:col-span-2">
            {{ user.secondaryEmail }}
          </dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Phone</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.phone }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Secondary Phone</dt>
          <dd class="sm:col-span-2">
            {{ user.secondPhone }}
          </dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Employee ID</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.empId }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Employee Post</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.empPost }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Package</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.package }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Allotment</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.allotment }}</dd>
        </div>
      </dl>
    </div>
  </section>
</template>
