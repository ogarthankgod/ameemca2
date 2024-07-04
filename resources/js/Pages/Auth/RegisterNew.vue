<script setup>
import InputError from "@/Components/InputError.vue";
// import InputLabel from "@/Components/InputLabel.vue";
// import PrimaryButton from "@/Components/PrimaryButton.vue";
// import TextInput from "@/Components/TextInput.vue";
import { Head, Link, useForm } from "@inertiajs/vue3";
import AmeemcaLogo from "@/Components/LogoIcon.vue";
import AmeemcaLogoPng from "@/Components/ameemca.png";

const props = defineProps({
    packages: Object,
    package: Object,
});

const priceFormatter = new Intl.NumberFormat("en-US");
const states = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "FCT - Abuja",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara",
];

const form = useForm({
    package: "",
    firstname: "",
    lastname: "",
    gender:'',
    email: "",
    phone:'',
    password: "",
    password_confirmation: "",
    employee_number: "",
    employee_post: "",
    agency_bureau: "",
    home_address: "",
    country: "nigeria",
    state: "",
    newsletterAccept: true,
});

props.package.length !== 0
    ? (form.package = props.package.id)
    : (form.package = 0);

const employeePosts = [
    { id: 1, post: "56002 - Nigeria-Abuja" },
    { id: 2, post: "56002 - Nigeria-Lagos" },
];

const submit = () => {
    form.post(route("register"), {
        onFinish: () => form.reset("password", "password_confirmation"),
    });
};
</script>

<template>
    <Head title="Sign Up" />

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
                        Welcome to AMEEMCA
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
                            Welcome to AMEEMCA
                        </h1>

                        <p class="mt-4 leading-relaxed text-gray-500">...</p>
                    </div>

                    <form
                        class="mt-8 grid grid-cols-6 gap-6"
                        @submit.prevent="submit"
                    >
                        <div class="col-span-6">
                            <label
                                for="package"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Package
                            </label>

                            <select
                                id="package"
                                name="package"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                v-model="form.package"
                                required
                            >
                                <option value="0" selected disabled>
                                    Select Package
                                </option>

                                <option
                                    v-for="pkg in props.packages"
                                    :value="pkg.id"
                                    :key="pkg.id"
                                >
                                    {{ pkg.package_name }} (N{{
                                        priceFormatter.format(
                                            pkg.package_price
                                        )
                                    }})
                                </option>
                            </select>
                            <InputError
                                class="mt2"
                                :message="form.errors.package"
                            />
                        </div>

                        <div class="col-span-6 sm:col-span-3">
                            <label
                                for="FirstName"
                                class="block text-sm font-medium text-gray-700"
                            >
                                First Name
                            </label>

                            <input
                                v-model="form.firstname"
                                type="text"
                                id="FirstName"
                                placeholder="firstname"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.firstname"
                            />
                        </div>

                        <div class="col-span-6 sm:col-span-3">
                            <label
                                for="LastName"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Last Name
                            </label>

                            <input
                                v-model="form.lastname"
                                type="text"
                                id="LastName"
                                placeholder="lastname"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.lastname"
                            />
                        </div>

                        <!-- <div class="col-span-6 sm:col-span-3">
                            <label
                                for="gender"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Gender
                            </label>

                             //Get radio or switch components from daisyUI for gender and phone
                            <input
                                v-model="form.firstname"
                                type="radio"
                                id="FirstName"
                                placeholder="firstname"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.firstname"
                            />
                        </div> -->

                        <div class="col-span-6">
                            <label
                                for="Email"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Email
                            </label>

                            <input
                                v-model="form.email"
                                type="email"
                                id="Email"
                                placeholder="email@webmail.com"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.email"
                            />
                        </div>

                        <div class="col-span-6 sm:col-span-3">
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
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.password"
                            />
                        </div>

                        <div class="col-span-6 sm:col-span-3">
                            <label
                                for="PasswordConfirmation"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Password Confirmation
                            </label>

                            <input
                                v-model="form.password_confirmation"
                                type="password"
                                id="PasswordConfirmation"
                                placeholder="confirm password"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.password_confirmation"
                            />
                        </div>

                        <div class="col-span-6 sm:col-span-3">
                            <label
                                for="employee_number"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Employee Number
                            </label>

                            <input
                                v-model="form.employee_number"
                                type="text"
                                id="employee_number"
                                placeholder="employee number"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            />
                            <InputError
                                class="mt2"
                                :message="form.errors.employee_number"
                            />
                        </div>

                        <div class="col-span-6 sm:col-span-3">
                            <label
                                for="employee_post"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Employee Post
                            </label>

                            <select
                                id="employee_post"
                                placeholder="employee post"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                v-model="form.employee_post"
                                required
                            >
                                <option value="" selected disabled>
                                    Your Employee Post
                                </option>

                                <option
                                    v-for="employeePost in employeePosts"
                                    :value="employeePost.id"
                                    :key="employeePost.id"
                                >
                                    {{ employeePost.post }}
                                </option>
                            </select>
                            <InputError
                                class="mt2"
                                :message="form.errors.employee_post"
                            />
                        </div>

                        <div class="col-span-6 sm:col-span-3">
                            <label
                                for="country"
                                class="block text-sm font-medium text-gray-700"
                            >
                                State
                            </label>

                            <select
                                id="state"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                v-model="form.state"
                                required
                            >
                                <option
                                    v-for="state in states"
                                    :key="state"
                                    value="state"
                                >
                                    {{ state }}
                                </option>
                            </select>
                            <InputError
                                class="mt2"
                                :message="form.errors.state"
                            />
                        </div>
                        <div class="col-span-6 sm:col-span-3">
                            <label
                                for="country"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Country
                            </label>

                            <select
                                id="country"
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                v-model="form.country"
                                required
                                disabled
                            >
                                <option value="nigeria" selected>
                                    Nigeria
                                </option>
                            </select>
                            <InputError
                                class="mt2"
                                :message="form.errors.country"
                            />
                        </div>

                        <div class="col-span-6">
                            <label
                                for="home_address"
                                class="block text-sm font-medium text-gray-700"
                            >
                                Home Address
                            </label>

                            <textarea
                                v-model="form.home_address"
                                type="text"
                                id="home_address"
                                placeholder="address..."
                                class="mt-1 w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                                required
                            ></textarea>

                            <InputError
                                class="mt2"
                                :message="form.errors.home_address"
                            />
                        </div>

                        <div class="col-span-6">
                            <label for="newsletterAccept" class="flex gap-4">
                                <input
                                    v-model="form.newsletterAccept"
                                    :checked="form.newsletterAccept"
                                    type="checkbox"
                                    id="newsletterAccept"
                                    class="size-5 rounded-md border-gray-200 bg-white shadow-sm"
                                    required
                                />

                                <span class="text-sm text-gray-700">
                                    I want to receive emails about events,
                                    product updates and company announcements.
                                </span>
                            </label>
                        </div>

                        <div class="col-span-6">
                            <p class="text-sm text-red-600">
                                By creating an account, you agree to our
                                <Link href="#" class="text-gray-700 underline">
                                    terms and conditions.</Link
                                >
                            </p>
                        </div>

                        <div
                            class="col-span-6 sm:flex sm:items-center sm:gap-4"
                        >
                            <button
                                class="inline-block shrink-0 rounded-md border border-blue-600 bg-blue-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-blue-500"
                                :disabled="form.processing"
                                :class="{ 'opacity-25': form.processing }"
                                type="submit"
                            >
                                Sign Up
                            </button>
                        </div>
                        <div class="mt-3 col-span-6">
                            <p class="mt-4 text-sm text-gray-500 sm:mt-0">
                                Already have an account?
                                <Link
                                    :href="route('login')"
                                    class="text-blue-700 underline"
                                    >Log in</Link
                                >.
                            </p>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </section>
</template>
