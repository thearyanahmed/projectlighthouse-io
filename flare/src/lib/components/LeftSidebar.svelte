<aside
    class="fixed inset-y-0 left-0 w-2xs overflow-y-auto border-r border-gray-950/10 group-data-sidebar-collapsed:hidden max-xl:hidden dark:border-white/10"
>
    <nav aria-label="Course" class="px-6 py-4">
        <div class="sticky top-4 flex h-6">
            <button
                type="button"
                aria-label="Toggle sidebar"
                class="relative *:relative before:absolute before:top-1/2 before:left-1/2 before:size-8 before:-translate-1/2 before:rounded-md before:bg-white/75 before:backdrop-blur-sm dark:before:bg-gray-950/75 data-hover:before:bg-gray-950/5 dark:data-hover:before:bg-white/5 focus:outline-hidden data-focus:before:outline-2 data-focus:before:outline-blue-700 data-focus:before:outline-solid"
                data-headlessui-state=""
                ><svg
                    viewBox="0 0 16 14"
                    fill="none"
                    class="shrink-0 stroke-gray-950 dark:stroke-white h-3.5 shrink-0"
                    ><path
                        d="M5.5 0.5H2.5C1.39543 0.5 0.5 1.39543 0.5 2.5V11.5C0.5 12.6046 1.39543 13.5 2.5 13.5H5.5M5.5 0.5H13.5C14.6046 0.5 15.5 1.39543 15.5 2.5V11.5C15.5 12.6046 14.6046 13.5 13.5 13.5H5.5M5.5 0.5V13.5"
                    ></path></svg
                ></button
            >
        </div>
        <div class="mt-3">
            <div class="max-xl:hidden space-y-8">
                <slot />
            </div>
        </div>
    </nav>
</aside>
