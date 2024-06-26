<script setup>
import { Head, Link, useForm } from "@inertiajs/vue3";
import Header from "./Header.vue";
import InputError from "@/Components/InputError.vue";
import womancontact from "./Images/art/contact-women-talking-svgrepo-com.svg";

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
});

const form = useForm({
    name: '',
    subject: '',
    email: '',
    phone: '',
    message: '',
});

const submit = () => {
    form.post(route("contact.email"), {
        onFinish: () => form.reset(),
    });
};
</script>

<template>
    <Head title="Vision" />
    <Header></Header>

    <section class="bg-gray-100">
        <div class="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 gap-x-16 gap-y-8 lg:grid-cols-5">
                <div class="lg:col-span-2 lg:py-12 mx-auto hidden lg:flex">
                    <!-- <p class="max-w-xl text-lg">
            At the same time, the fact that we are wholly owned and totally independent from
            manufacturer and other group control gives you confidence that we will only recommend what
            is right for you.
          </p>
  
          <div class="mt-8">
            <a href="#" class="text-2xl font-bold text-blue-600"> 0151 475 4450 </a>
  
            <address class="mt-2 not-italic">282 Kevin Brook, Imogeneborough, CA 58517</address>
          </div> -->

                    <img :src="womancontact" alt="" />
                </div>

                <div
                    class="rounded-lg bg-white p-8 shadow-lg lg:col-span-3 lg:p-12"
                >
                    <form class="space-y-4" @submit.prevent="submit">
                        <div>
                            <label class="sr-only" for="name">Name</label>
                            <input
                                class="w-full rounded-lg border-gray-200 p-3 text-sm"
                                placeholder="Name"
                                type="text"
                                id="name"
                                v-model="form.name"
                            />
                            <InputError
                                class="mt-3"
                                :message="form.errors.name"
                            />
                        </div>

                        <div>
                            <label class="sr-only" for="name">Subject</label>
                            <input
                                class="w-full rounded-lg border-gray-200 p-3 text-sm"
                                placeholder="Subject"
                                type="text"
                                id="subject"
                                v-model="form.subject"
                            />
                            <InputError
                                class="mt-3"
                                :message="form.errors.subject"
                            />
                        </div>

                        <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                            <div>
                                <label class="sr-only" for="email">Email</label>
                                <input
                                    class="w-full rounded-lg border-gray-200 p-3 text-sm"
                                    placeholder="Email address"
                                    type="email"
                                    id="email"
                                    v-model="form.email"
                                />
                                <InputError
                                    class="mt-3"
                                    :message="form.errors.email"
                                />
                            </div>

                            <div>
                                <label class="sr-only" for="phone">Phone</label>
                                <input
                                    class="w-full rounded-lg border-gray-200 p-3 text-sm"
                                    placeholder="Phone Number"
                                    type="tel"
                                    id="phone"
                                    v-model="form.phone"
                                />
                                <InputError
                                    class="mt-3"
                                    :message="form.errors.phone"
                                />
                            </div>
                        </div>

                        <div>
                            <label class="sr-only" for="message">Message</label>

                            <textarea
                                class="w-full rounded-lg border-gray-200 p-3 text-sm"
                                placeholder="Message"
                                rows="8"
                                id="message"
                                v-model="form.message"
                            ></textarea>
                            <InputError
                                class="mt-3"
                                :message="form.errors.message"
                            />
                        </div>

                        <div class="mt-4">
                            <button
                                type="submit"
                                class="inline-block w-full rounded-lg bg-primary-800 hover:bg-primary-600 px-5 py-3 font-medium text-white sm:w-auto"
                                :disabled="form.processing"
                                :class="{ 'opacity-25': form.processing }"
                            >
                                Send Enquiry
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</template>
