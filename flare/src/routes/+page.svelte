<script lang="ts">
    import type { PageProps } from "./$types";

    const { data }: PageProps = $props();
</script>

<div class="flex flex-col justify-center fancy-normal">
    <div class="px-4 sm:px-6 flex w-full max-w-4xl mx-auto justify-center">
        <div class="mt-20">
            <div>
                <span class="text-red-500 text-5xl fancy-normal">
                    /'lighthouse/
                </span>
            </div>
            <p class="py-2 mt-4 text-md italic text-gray-400">
                <span
                    class="bg-gray-900 text-white text-sm rounded-md px-2 py-1"
                    >noun</span
                >
                <span class="px-2 py-1"> Your beacon through the noise. </span>
            </p>
            <p class="text-md mt-4">
                In a sea of <span class="text-gray-400">shallow tutorials</span>
                and overhyped promises, a Lighthouse stands firm — guiding.
            </p>
            <p class="text-md mt-4">
                No fluff. No shortcuts.
                <span class="underline italic"
                    >Just depth, direction, and discipline</span
                >.
            </p>
        </div>
    </div>

    <!-- Content section -->

    <div class="bg-white py-24 sm:py-32">
        <div class="mx-auto max-w-4xl px-6 lg:px-8">
            <div class="mx-auto max-w-2xl justify-center">
                <h2 class="text-pretty text-md text-gray-900 sm:text-3xl">
                    The journey can may here
                </h2>
                <p class="mt-2 text-lg/8 text-gray-600">
                    Learn how to grow your business with our expert advice.
                </p>
                <div class="mt-16 space-y-20 lg:mt-20 lg:space-y-20">
                    {#each data.courses as course (course.id)}
                        <article
                            class="relative isolate flex flex-col gap-8 lg:flex-row"
                        >
                            <div
                                class="relative aspect-video sm:aspect-[2/1] lg:aspect-square lg:w-64 lg:shrink-0"
                            >
                                <img
                                    src={course.thumbnail}
                                    alt={course.name}
                                    class="absolute inset-0 size-full rounded-md bg-gray-50 object-cover"
                                />
                                <div
                                    class="absolute inset-0 rounded-2xl ring-1 ring-inset ring-gray-900/10"
                                ></div>
                            </div>
                            <div>
                                <div class="flex items-center gap-x-4 text-xs">
                                    <time
                                        datetime="2020-03-16"
                                        class="text-gray-500">Mar 16, 2020</time
                                    >
                                </div>
                                <div class="group relative max-w-xl">
                                    <h3
                                        class="mt-3 text-lg/6 font-semibold text-gray-900 group-hover:text-gray-600"
                                    >
                                        <a href={`/c/${course.slug}`}>
                                            <span class="absolute inset-0"
                                            ></span>
                                            {course.name}
                                        </a>
                                    </h3>
                                    <p class="mt-5 text-sm/6 text-gray-600">
                                        {course.description}
                                    </p>
                                </div>
                            </div>
                        </article>
                    {/each}
                </div>
            </div>
        </div>
    </div>
</div>
