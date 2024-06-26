<template>
    <VaSidebar :color="primary" minimized-width="0">
        <VaAccordion multiple>
            <VaCollapse>
                <template #header="{ value: isCollapsed }">
                    <VaSidebarItem
                        :active="false"
                        role="button"
                        hover-opacity="0.10"
                    >
                        <VaSidebarItemContent class="py-3 pr-2 pl-4">
                            <VaIcon name="settings" />

                            <VaSidebarItemTitle
                                class="flex justify-between items-center leading-5 font-semibold"
                            >
                                Dashboard
                            </VaSidebarItemTitle>
                        </VaSidebarItemContent>
                    </VaSidebarItem>
                </template>
            </VaCollapse>

            <VaCollapse>
                <template #header="{ value: isCollapsed }">
                    <VaSidebarItem role="button" hover-opacity="0.10">
                        <VaSidebarItemContent class="py-3 pr-2 pl-4">
                            <VaIcon name="settings" />

                            <VaSidebarItemTitle
                                class="flex justify-between items-center leading-5 font-semibold"
                            >
                                Sidebarlink
                                <VaIcon
                                    name="arrowDirection(isCollapsed)"
                                    size="20px"
                                />
                            </VaSidebarItemTitle>
                        </VaSidebarItemContent>
                    </VaSidebarItem>
                </template>
                <template #body>
                    <div>
                        <VaSidebarItem
                            :to="child"
                            :active="true"
                            :active-color="activeColor"
                            :aria-label="`Visit route.displayName}`"
                            hover-opacity="0.10"
                        >
                            <VaSidebarItemContent class="py-3 pr-2 pl-11">
                                <VaSidebarItemTitle
                                    class="leading-5 font-semibold"
                                >
                                    Child displayName
                                </VaSidebarItemTitle>
                            </VaSidebarItemContent>
                        </VaSidebarItem>
                    </div>
                </template>
            </VaCollapse>
        </VaAccordion>
    </VaSidebar>
</template>

<script setup></script>
