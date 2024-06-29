<script setup>
// import Checkbox from "@/Components/Checkbox.vue";
// import GuestLayout from "@/Layouts/GuestLayout.vue";
import InputError from "@/Components/InputError.vue";
// import InputLabel from "@/Components/InputLabel.vue";
// import PrimaryButton from "@/Components/PrimaryButton.vue";
// import TextInput from "@/Components/TextInput.vue";
import { Head, Link, useForm } from "@inertiajs/vue3";
import AmeemcaLogo from "@/Components/LogoIcon.vue"

defineProps({
    canResetPassword: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});

const form = useForm({
    staffid: "",
    password: "",
    remember: false,
});

const submit = () => {
    form.post(route("login"), {
        onFinish: () => form.reset("password"),
    });
};
</script>

<template>
    <Head title="Log in" />
    <div
        class="bg-gray-50 flex flex-col items-center justify-center px-6 pt-8 mx-auto md:h-screen pt:mt-0 dark:bg-gray-900">
        <Link href="/" class="flex items-center justify-center mb-8 text-2xl font-semibold lg:mb-10 dark:text-white">
                <AmeemcaLogo class="w-20 h-20 fill-current text-gray-500" />
        </Link>
        <!-- Card -->
        <div class="w-full max-w-xl p-6 space-y-8 sm:p-8 bg-white rounded-lg shadow dark:bg-gray-800">
            <h2 class="text-2xl font-bold text-gray-900 dark:text-white text-center">
                Sign in to AMEEMCA
            </h2>
            <form class="mt-8 space-y-6" @submit.prevent="submit">
                <div>
                    <label for="staffid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">StaffID</label>
                    <input v-model="form.staffid" type="number" name="staffid" id="staffid"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                        placeholder="staff ID" required />
                    <InputError class="mt2" :message="form.errors.staffid" />
                </div>
                <div>
                    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                    <input v-model="form.password" type="password" name="password" id="password" placeholder="••••••••"
                        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                        required />
                    <InputError class="mt2" :message="form.errors.password" />
                </div>
                <div class="flex items-start">
                    <div class="flex items-center h-5">
                        <input v-model="form.remember" id="remember" aria-describedby="remember" name="remember"
                            type="checkbox"
                            class="w-4 h-4 border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:focus:ring-primary-600 dark:ring-offset-gray-800 dark:bg-gray-700 dark:border-gray-600" />
                    </div>
                    <div class="ml-3 text-sm">
                        <label for="remember" class="font-medium text-gray-900 dark:text-white">Remember me</label>
                    </div>
                    <Link v-if="canResetPassword" :href="route('password.request')"
                        class="ml-auto text-sm text-primary-700 hover:underline dark:text-primary-500">Lost Password?
                    </Link>
                </div>
                <button :disabled="form.processing" :class="{ 'opacity-25': form.processing }" type="submit"
                    class="w-full px-5 py-3 text-base font-medium text-center text-white bg-primary-700 rounded-lg hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                    Login
                </button>
                <div class="text-sm font-medium text-gray-500 dark:text-gray-400">
                    Not registered?
                    <Link :href="route('register')" class="text-primary-700 hover:underline dark:text-primary-500">Create account</Link>
                </div>
            </form>
        </div>
    </div>
</template>
