<script lang="ts">
    import {
        course_metadata_count,
        lesson_duration,
        type CourseMetadataCount,
    } from "$lib/helpers";
    import type { PageProps } from "./$types";

    let { data }: PageProps = $props();

    const course = data.course;

    let course_metadata: CourseMetadataCount | null = course
        ? course_metadata_count(course)
        : null;
</script>

<div>
    {#if data.error}
        <p class="text-red-500">Error: {data.error}</p>
    {/if}

    {#if course}
        <main class="mt-10 px-4 sm:px-6">
            <div class="relative mx-auto max-w-7xl">
                <div
                    class="absolute -inset-x-2 top-0 -z-10 h-80 overflow-hidden rounded-t-2xl mask-b-from-60% sm:h-88 md:h-112 lg:-inset-x-4 lg:h-128"
                >
                    <img
                        alt={course.name}
                        src={course.thumbnail}
                        class="absolute inset-0 h-full w-full mask-l-from-60% object-cover object-center opacity-40"
                    />
                    <div
                        class="absolute inset-0 rounded-t-2xl outline-1 -outline-offset-1 outline-gray-950/10 dark:outline-white/10"
                    ></div>
                </div>
                <div class="mx-auto max-w-6xl">
                    <div class="relative">
                        <div class="px-4 pt-48 pb-12 lg:py-24">
                            <h1 class="sr-only">Course overview</h1>
                            <p
                                class="mt-7 max-w-lg text-base/7 text-pretty text-gray-600 dark:text-gray-400"
                            >
                                {course.description}
                            </p>
                            <div
                                class="mt-6 flex flex-wrap items-center gap-x-4 gap-y-3 text-sm/7 font-semibold text-gray-950 sm:gap-3 dark:text-white"
                            >
                                <span
                                    class="hidden text-gray-950/25 sm:inline dark:text-white/25"
                                    >·</span
                                >
                                <div class="flex items-center gap-1.5">
                                    <svg
                                        viewBox="0 0 16 16"
                                        fill="none"
                                        class="stroke-gray-950/40 dark:stroke-white/40 h-4 shrink-0"
                                        ><path
                                            d="M10.5 4.5H6.5c-.55 0-1 .45-1 1v6m4-7h3c.55 0 1 .45 1 1v9c0 .55-.45 1-1 1H6.5c-.55 0-1-.45-1-1v-3m4-7V1.5c0-.55-.45-1-1-1h-7c-.55 0-1 .45-1 1v9c0 .55.45 1 1 1h3"
                                        ></path></svg
                                    >{course.lessons.length} lessons
                                </div>
                                <span
                                    class="hidden text-gray-950/25 sm:inline dark:text-white/25"
                                    >·</span
                                >
                                <div class="flex items-center gap-1.5">
                                    <svg
                                        viewBox="0 0 16 16"
                                        fill="none"
                                        class="stroke-gray-950/40 dark:stroke-white/40 h-4 shrink-0"
                                        ><circle cx="8" cy="8" r="7.5"
                                        ></circle><path d="M8 4V8H12"
                                        ></path></svg
                                    >{course_metadata?.total_duration}
                                </div>
                            </div>
                            <div class="mt-10">
                                <a
                                    class="inline-flex items-center gap-x-2 rounded-full bg-gray-950 px-3 py-0.5 text-sm/7 font-semibold text-white hover:bg-gray-800 dark:bg-gray-700 dark:hover:bg-gray-600"
                                    href="/landscape-of-choice"
                                    ><svg
                                        viewBox="0 0 8 8"
                                        fill="none"
                                        class="fill-white h-2 shrink-0"
                                        ><path
                                            d="M7.25 3.567a.5.5 0 0 1 0 .866L2.75 7.031a.5.5 0 0 1-.75-.433V1.402a.5.5 0 0 1 .75-.433l4.5 2.598Z"
                                        ></path></svg
                                    >Start the course</a
                                >
                            </div>
                        </div>
                        <div class="grid grid-cols-1 gap-y-16 pb-10 sm:px-4">
                            {#if course.lessons.length === 0}
                                <div class="col-span-full">
                                    <p class="text-gray-500 dark:text-gray-400">
                                        This course has no lessons yet.
                                    </p>
                                </div>
                            {/if}

                            <section
                                id="orientation"
                                class="grid grid-cols-4 border-t border-gray-950/10 dark:border-white/10"
                            >
                                <div class="col-span-full sm:col-span-1">
                                    <!-- <div
                                            class="-mt-px inline-flex border-t border-gray-950 pt-px dark:border-white"
                                        >
                                            <div
                                                class="pt-4 text-sm/7 font-semibold text-gray-950 sm:pt-10 dark:text-white"
                                            >
                                                Module {module.position}
                                            </div>
                                        </div> -->
                                </div>
                                <div
                                    class="col-span-full pt-6 sm:col-span-3 sm:pt-10"
                                >
                                    <div class="max-w-2xl">
                                        <ol class="mt-6 space-y-4">
                                            {#each course.lessons as lesson (lesson.id)}
                                                <li>
                                                    <div class="flow-root">
                                                        <a
                                                            class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                            href={`/c/${course.slug}/learn/${lesson.id}/#${lesson.name
                                                                .replace(
                                                                    /\s+/g,
                                                                    "-",
                                                                )
                                                                .toLowerCase()}`}
                                                            ><div
                                                                class="flex h-lh shrink items-center"
                                                            >
                                                                <svg
                                                                    viewBox="0 0 16 16"
                                                                    fill="none"
                                                                    class="fill-gray-950 stroke-gray-950/40 dark:fill-white dark:stroke-white/40 h-4 shrink-0"
                                                                    ><circle
                                                                        fill="none"
                                                                        cx="8"
                                                                        cy="8"
                                                                        r="7.5"

                                                                    ></circle><path
                                                                        stroke="none"
                                                                        d="M10.25 7.56699C10.5833 7.75944 10.5833 8.24056 10.25 8.43301L7.25 10.1651C6.91667 10.3575 6.5 10.117 6.5 9.73205L6.5 6.26795C6.5 5.88305 6.91667 5.64249 7.25 5.83494L10.25 7.56699Z"

                                                                    ></path></svg
                                                                >
                                                            </div>
                                                            <div>
                                                                <div>
                                                                    <span
                                                                        class="font-semibold text-gray-950 dark:text-white"
                                                                        >{lesson.name}</span
                                                                    ><span
                                                                        class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                        >·</span
                                                                    ><span
                                                                        class="hidden text-gray-500 sm:inline"
                                                                        >{lesson_duration(
                                                                            lesson,
                                                                        )}</span
                                                                    >
                                                                </div>
                                                                <p
                                                                    class="text-gray-700 dark:text-gray-400"
                                                                >
                                                                    {lesson.meta_description}
                                                                </p>
                                                                <div
                                                                    class="text-gray-500 sm:hidden"
                                                                >
                                                                    {lesson_duration(
                                                                        lesson,
                                                                    )}
                                                                </div>
                                                            </div></a
                                                        >
                                                    </div>
                                                </li>
                                            {/each}
                                        </ol>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    {/if}
</div>
