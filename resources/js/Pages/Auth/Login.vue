<script setup>
import InputError from "@/Components/InputError.vue";
// import InputLabel from "@/Components/InputLabel.vue";
// import PrimaryButton from "@/Components/PrimaryButton.vue";
// import TextInput from "@/Components/TextInput.vue";
import { Head, Link, useForm } from "@inertiajs/vue3";
import AmeemcaLogo from "@/Components/LogoIcon.vue";
import AmeemcaLogoPng from "@/Components/ameemca.png";

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
    <Head title="Sign In" />

    <section class="bg-white">
        <div class="lg:grid lg:min-h-screen lg:grid-cols-12">
            <section
                class="relative flex h-32 items-end bg-gray-900 lg:col-span-5 lg:h-full xl:col-span-6"
            >
                <img
                    alt=""
                    src="https://images.unsplash.com/photo-1617195737496-bc30194e3a19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                    class="absolute inset-0 h-full w-full object-cover opacity-80"
                />

                <div class="hidden lg:relative lg:block lg:p-12">
                    <Link class="block text-white" href="#">
                        <span class="sr-only">Home</span>
                        <AmeemcaLogo
                            class="w-20 h-20 fill-current text-gray-500"
                        />
                    </Link>

                    <h2
                        class="mt-6 text-2xl font-bold text-white sm:text-3xl md:text-4xl"
                    >
                        Sign in to AMEEMCA!
                    </h2>

                    <p class="mt-4 leading-relaxed text-white/90">...</p>
                </div>
            </section>

            <main
                class="flex items-center justify-center px-8 py-8 sm:px-12 lg:col-span-7 lg:px-16 lg:py-12 xl:col-span-6"
            >
                <div class="max-w-xl lg:max-w-3xl">
                    <div class="relative -mt-16 block lg:hidden">
                        <Link
                            class="inline-flex size-16 items-center justify-center rounded-full bg-white text-blue-600 sm:size-20"
                            href="#"
                        >
                            <span class="sr-only">Home</span>
                            <img
                                :src="AmeemcaLogoPng"
                                class="w-20 h-20 fill-current text-gray-500"
                            />
                        </Link>

                        <h1
                            class="mt-2 text-2xl font-bold text-gray-900 sm:text-3xl md:text-4xl"
                        >
                            Sign in to AMEEMCA!
                        </h1>

                        <p class="mt-4 leading-relaxed text-gray-500">...</p>
                    </div>

                    <form
                        class="mt-8"
                        @submit.prevent="submit"
                    >
                        <div class="col-span-3">
                            <label
                                for="staffid"
                                class="block text-sm font-medium text-gray-700"
                            >
                                StaffID
                            </label>

                            <input
                                v-model="form.staffid"
                                type="number"
                                id="staffid"
                                placeholder=""
                                class="mt-1 w-64 rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.staffid"
                            />
                        </div>

                        <div class="col-span-3 mt-4">
                            <label
                                for="Password"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Password
                            </label>

                            <input
                                v-model="form.password"
                                type="password"
                                id="Password"
                                placeholder="password"
                                class="mt-1 w-64 rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.password"
                            />
                        </div>

                        <div class="flex items-start mt-5">
                            <div class="flex items-center h-5">
                                <input
                                    v-model="form.remember"
                                    id="remember"
                                    aria-describedby="remember"
                                    name="remember"
                                    type="checkbox"
                                    class="w-4 h-4 border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:focus:ring-primary-600 dark:ring-offset-gray-800 dark:bg-gray-700 dark:border-gray-600"
                                />
                            </div>
                            <div class="ml-3 text-sm">
                                <label
                                    for="remember"
                                    class="font-medium text-gray-900 dark:text-white"
                                    >Remember me</label
                                >
                            </div>
                            <Link
                                v-if="canResetPassword"
                                :href="route('password.request')"
                                class="ml-auto text-sm text-primary-700 hover:underline dark:text-primary-500"
                                >Lost Password?
                            </Link>
                        </div>

                        <button
                            :disabled="form.processing"
                            :class="{ 'opacity-25': form.processing }"
                            type="submit"
                            class="mt-4 w-full px-5 py-3 text-base font-medium text-center text-white bg-primary-700 rounded-lg hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                        >
                            Login
                        </button>

                        <div class="mt-3 col-span-6">
                            <p class="mt-4 text-sm text-gray-500 sm:mt-0">
                                Not registered?
                                <Link
                                    :href="route('register')"
                                    class="text-blue-700 underline"
                                    >Create Account</Link
                                >.
                            </p>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </section>
</template>
