<script setup>
import DangerButton from "@/Components/DangerButton.vue";
import SecondaryButton from "@/Components/SecondaryButton.vue";

const user = usePage().props.auth.user;
</script>

<template>
  <section class="space-y-6">
    <header>
      <h2 class="text-lg font-medium text-gray-900">Profile Information</h2>
    </header>

    <div class="flow-root">
      <dl class="-my-3 divide-y divide-gray-100 text-sm">
        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Name</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.fullname }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Email</dt>
          <dd class="text-gray-700 sm:col-span-2">{{ user.email }}</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Occupation</dt>
          <dd class="text-gray-700 sm:col-span-2">Guitarist</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Salary</dt>
          <dd class="text-gray-700 sm:col-span-2">$1,000,000+</dd>
        </div>

        <div class="grid grid-cols-1 gap-1 py-3 sm:grid-cols-3 sm:gap-4">
          <dt class="font-medium text-gray-900">Bio</dt>
          <dd class="text-gray-700 sm:col-span-2">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Et facilis debitis
            explicabo doloremque impedit nesciunt dolorem facere, dolor quasi veritatis
            quia fugit aperiam aspernatur neque molestiae labore aliquam soluta
            architecto?
          </dd>
        </div>
      </dl>
    </div>
  </section>
</template>
