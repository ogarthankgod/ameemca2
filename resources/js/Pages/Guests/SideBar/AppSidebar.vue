<script setup>
import { ref } from "vue";
import { VaSidebarItemContent } from "vuestic-ui/web-components";
import { useBreakpoint } from "vuestic-ui";

const breakpoints = useBreakpoint();
const isMobile = ref(false);
isMobile.value = breakpoints.smDown;

const activeElement = ref("Dashboard");


const GuestItems = [
    { title: "Home", icon: "dashboard" },
    { title: "Team", icon: "dashboard" },
    { title: "Vision", icon: "dashboard" },
    { title: "Membership", icon: "dashboard" },
    { title: "FAQ", icon: "dashboard" },
    { title: "Contact Us", icon: "dashboard" },
];
</script>

<template>
    <!-- <div style="height: 500px"> -->
    <VaSidebar minimized-width="0" class="w-auto">
        <VaAccordion multiple>
            <template v-for="item in GuestItems">
                <VaCollapse
                    v-if="item.children"
                    :key="item.title + 'collapse'"
                    body-color=""
                    class="text-sm"
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
                            :key="child.title"
                            :active="child.title === activeElement"
                            @click="activeElement = child.title"
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
    </VaSidebar>
</template>
