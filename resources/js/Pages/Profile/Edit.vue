<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import SectionHead from "@/Layouts/SectionHead.vue";
import DeleteUserForm from "./Partials/DeleteUserForm.vue";
import UserInformation from "./Partials/UserInformation.vue";
import UpdatePasswordForm from "./Partials/UpdatePasswordForm.vue";
import UpdateProfileInformationForm from "./Partials/UpdateProfileInformationForm.vue";
import { Head } from "@inertiajs/vue3";

defineOptions({
  layout: AuthenticatedLayout,
});

defineProps({
  mustVerifyEmail: {
    type: Boolean,
  },
  status: {
    type: String,
  },
});
</script>

<template>
  <Head title="Profile" />

  <SectionHead text="Profile" />

  <div class="py-4 mx-auto">
    <div class="max-w-7xl mx-auto :sm:px-6 :lg:px-8 space-y-6">
      <div class="p-4 sm:p-8 bg-white shadow rounded-md sm:rounded-lg">
        <UserInformation class="max-w-xl" />
      </div>

      <div class="p-4 sm:p-8 bg-white shadow rounded-md sm:rounded-lg">
        <UpdateProfileInformationForm
          :must-verify-email="mustVerifyEmail"
          :status="status"
          class="max-w-xl"
        />
      </div>

      <div class="p-4 sm:p-8 bg-white shadow rounded-md sm:rounded-lg">
        <UpdatePasswordForm class="max-w-xl" />
      </div>

      <div class="p-4 sm:p-8 bg-white shadow rounded-md sm:rounded-lg">
        <DeleteUserForm class="max-w-xl" />
      </div>
    </div>
  </div>
</template>
