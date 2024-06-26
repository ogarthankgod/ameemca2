<script setup>
import { ref } from "vue";
import { VaSidebarItemContent } from "vuestic-ui/web-components";
import { useBreakpoint } from "vuestic-ui";

const breakpoints = useBreakpoint();
const isMobile = ref(false);
isMobile.value = breakpoints.smDown;

const activeElement = ref("Dashboard");

const AdminItems = [
    { title: "Dashboard", icon: "dashboard" },
    {
        title: "Messages",
        icon: "mail",
        children: [
            { title: "Send", icon: "send" },
            { title: "Drafts", icon: "drafts" },
        ],
    },
    { title: "Address book", icon: "room" },
    {
        title: "Documents",
        icon: "folder",
        children: [
            { title: "Reports", icon: "article" },
            { title: "Notes", icon: "note" },
        ],
    },
];

const UserItems = [
    { title: "Dashboard", icon: "dashboard" },
    {
        title: "Messanger",
        icon: "mail",
        children: [
            { title: "Send", icon: "send" },
            { title: "Messages", icon: "drafts" },
        ],
    },
    {
        title: "Finance",
        icon: "money",
        children: [
            { title: "Fund Wallet", icon: "send" },
            { title: "Wallet History", icon: "drafts" },
            { title: "Withdrawal", icon: "send" },
        ],
    },

    {
        title: "Loans",
        icon: "money",
        children: [
            { title: "Request Loan", icon: "send" },
            { title: "Loan History", icon: "send" },
            { title: "Repay Loan", icon: "drafts" },
            { title: "Repayment History", icon: "drafts" },
        ],
    },

    {
        title: "Guarantor Requests",
        icon: "mail",
        children: [
            { title: "Pending Request", icon: "send" },
            { title: "Request History", icon: "drafts" },
        ],
    },
    {
        title: "Documents",
        icon: "mail",
        children: [
            { title: "Beneficiary Document", icon: "send" },
            { title: "Allotment Document", icon: "send" },
            { title: "Other Documents", icon: "drafts" },
        ],
    },


    {
        title: "Settings",
        icon: "money",
        children: [
            { title: "Update Profile", icon: "send" },
            { title: "Bank Manager", icon: "drafts" },
        ],
    },

    { title: "Forums", icon: "room" },
    {
        title: "Settings",
        icon: "settings",
    },
];
</script>

<template>
    <!-- <div style="height: 500px"> -->
    <VaSidebar minimized-width="0" class="w-auto colored-sidebar" activeColor="BackgroundBorder" color="BackgroundSecondary">
        <VaAccordion multiple>
            <template v-for="item in UserItems">
                <VaCollapse
                    v-if="item.children"
                    :key="item.title + 'collapse'"
                    body-color=""
                    class="text-sm"
                    :activeColor="secondary"
                >
                    <template #header="{ value: isCollapsed }">
                        <VaSidebarItem
                            :active="
                                item.children.some(
                                    (child) => child.title === activeElement
                                )
                            "
                        >
                            <VaSidebarItemContent>
                                <VaIcon :name="item.icon" />
                                <VaSidebarItemTitle>{{
                                    item.title
                                }}</VaSidebarItemTitle>
                                <VaSpacer />
                                <VaIcon
                                    :name="
                                        isCollapsed
                                            ? 'va-arrow-up'
                                            : 'va-arrow-down'
                                    "
                                />
                            </VaSidebarItemContent>
                        </VaSidebarItem>
                    </template>

                    <template #body>
                        <VaSidebarItem
                            v-for="child in item.children"
                            :key="child.title+'childItem'"
                            :active="child.title === activeElement"
                            @click="activeElement = child.title"
                            class="text-sm px-1"

                        >
                            <VaSidebarItemContent>
                                <VaIcon :name="child.icon" />
                                <VaSidebarItemTitle>{{
                                    child.title
                                }}</VaSidebarItemTitle>
                            </VaSidebarItemContent>
                        </VaSidebarItem>
                    </template>
                </VaCollapse>

                <VaSidebarItem
                    v-else
                    :key="item.title + 'item'"
                    :active="item.title === activeElement"
                    @click="activeElement = item.title"
                    class="text-sm"
                >
                    <VaSidebarItemContent>
                        <VaIcon :name="item.icon" />
                        <VaSidebarItemTitle>{{
                            item.title
                        }}</VaSidebarItemTitle>
                    </VaSidebarItemContent>
                </VaSidebarItem>
            </template>
        </VaAccordion>

        <VaSpacer />

        <!-- <VaSidebarItem
            :active="'Settings' === activeElement"
            @click="activeElement = 'Settings'"
        >
            <VaSidebarItemContent>
                <VaIcon name="settings" />
                <VaSidebarItemTitle>Settings</VaSidebarItemTitle>
            </VaSidebarItemContent>
        </VaSidebarItem> -->
    </VaSidebar>
    <!-- </div> -->
</template>

<style scoped>
    .va-sidebar-item--active.text-sm {
        border-left: 4px solid red !important;
    }
</style>