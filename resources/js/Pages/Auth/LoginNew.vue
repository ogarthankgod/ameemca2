<script setup>
import Checkbox from "@/Components/Checkbox.vue";
import GuestLayout from "@/Layouts/GuestLayout.vue";
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import { Head, Link, useForm } from "@inertiajs/vue3";
// import VaButton from 'vuestic-ui';

defineProps({
    canResetPassword: {
        type: Boolean,
    },
    status: {
        type: String,
    },
    errors: {},
});

const form = useForm({
    staffid: "",
    password: "",
    remember: true,
});

const submit = () => {
    form.post(route("login"), {
        onFinish: () => form.reset("password"),
    });
};
</script>

<template>
    <Head title="New Log in" />

    <div class="background min-h-screen flex justify-center items-center">
        <div class="bg-gray-200 h-fit rounded-md py-10 px-10 md:w-3/4 flex flex-col md:flex-row gap-3">
            <!-- Left Column -->
            <div class="w-full">
                🛄<br />
                <h1 class="text-lg font-bold mt-2">Ameemca CoPerative Society</h1>
                <p class="block mt-2">
                    Ready to take your savings and investments to the next
                    level?
                </p>
            </div>

            <!-- Right Column -->
            <div class="flex flex-col items-center w-full">
                <div
                    v-if="errors"
                    class="mb-4 font-medium text-sm text-green-600"
                >
                    {{ errors.message }}
                </div>

                <div class="my-3">
                    <p>Welcome Back</p>
                    <p>Sign In</p>
                </div>

                <form @submit.prevent="submit" class="justify-center">
                    <div>
                        <!-- <InputLabel for="staffid" value="Staffid" /> -->

                        <TextInput
                            id="staffid"
                            type="number"
                            class="mt-1 block h-10 w-60 rounded-xl pl-5 bg-gray-100"
                            v-model="form.staffid"
                            required
                            autofocus
                            autocomplete="staffid"
                            placeholder="Staff ID"
                        />

                        <!-- <InputError class="mt-3" :message="form.errors.staffid" /> -->
                    </div>

                    <div class="mt-5">
                        <!-- <InputLabel for="password" value="Password" /> -->

                        <TextInput
                            id="password"
                            type="password"
                            class="mt-1 block h-10 w-60 rounded-xl pl-5 bg-gray-100"
                            v-model="form.password"
                            required
                            autocomplete="current-password"
                            placeholder="******"
                        />

                        <InputError
                            class="mt-3"
                            :message="form.errors.password"
                        />
                    </div>

                    <div class="mt-4 hidden">
                        <label class="">
                            <Checkbox
                                name="remember"
                                v-model:checked="form.remember"
                            />
                            <span class="ms-2 text-sm text-gray-600"
                                >Remember me</span
                            >
                        </label>
                    </div>

                    <div class="flex flex-col items-center justify- mt-4">
                        <Link
                            v-if="canResetPassword"
                            :href="route('password.request')"
                            class="text-xs text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 self-start"
                        >
                            Forgot password?
                        </Link>

                        <button
                            type="submit"
                            class="mt-5 text-center justify-center rounded-md w-60 background text-gray-100 h-10"
                            style=""
                            :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing"
                        >
                            Log in
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<style scoped>
.background {
    background-color: rgb(40 61 90);
}
.text-color {
    color: rgb(40 61 90);
}
</style>
