<script lang="ts">
    import {
        course_metadata_count,
        type CourseMetadataCount,
    } from "$lib/helpers";
    import type { PageProps } from "./$types";

    let { data }: PageProps = $props();

    const course = data.course;
    let course_metadata: CourseMetadataCount = {};

    if (course) {
        course_metadata = course_metadata_count(course);
    }
</script>

<div>
    {#if data.error}
        <p class="text-red-500">Error: {data.error}</p>
    {/if}

    {#if course}
        <main class="px-4 sm:px-6">
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
                                <div class="flex items-center gap-1.5">
                                    <svg
                                        viewBox="0 0 16 16"
                                        fill="none"
                                        class="stroke-gray-950/40 dark:stroke-white/40 h-4 shrink-0"
                                        ><path
                                            d="M13.5 12.5V.5H4.5M13.5 12.5l-.26.39c-.45.67-.45 1.48 0 2.15l.26.46H4c-.83 0-1.5-.67-1.5-1.5v0M13.5 12.5H4.5M2.5 14V2.5C2.5 1.4 3.4.5 4.5.5v0M2.5 14c0-.83.67-1.5 1.5-1.5h.5M4.5.5v12"
                                            stroke-linejoin="round"
                                        ></path></svg
                                    >{course_metadata.modules}<!-- --> modules
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
                                        ><path
                                            d="M10.5 4.5H6.5c-.55 0-1 .45-1 1v6m4-7h3c.55 0 1 .45 1 1v9c0 .55-.45 1-1 1H6.5c-.55 0-1-.45-1-1v-3m4-7V1.5c0-.55-.45-1-1-1h-7c-.55 0-1 .45-1 1v9c0 .55.45 1 1 1h3"
                                        ></path></svg
                                    >{course_metadata.lessons}<!-- --> lessons
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
                                    >{course_metadata.total_duration}
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
                            <section
                                id="orientation"
                                class="grid grid-cols-4 border-t border-gray-950/10 dark:border-white/10"
                            >
                                <div class="col-span-full sm:col-span-1">
                                    <div
                                        class="-mt-px inline-flex border-t border-gray-950 pt-px dark:border-white"
                                    >
                                        <div
                                            class="pt-4 text-sm/7 font-semibold text-gray-950 sm:pt-10 dark:text-white"
                                        >
                                            Part 1
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="col-span-full pt-6 sm:col-span-3 sm:pt-10"
                                >
                                    <div class="max-w-2xl">
                                        <h2
                                            class="text-2xl/7 font-medium tracking-tight text-pretty text-gray-950 dark:text-white"
                                        >
                                            Orientation: Understanding Where You
                                            Are
                                        </h2>
                                        <p
                                            class="mt-4 text-base/7 text-gray-700 sm:text-sm/7 dark:text-gray-400"
                                        >
                                            You need to know where you're
                                            starting from, before you can
                                            pretend to decide where you're
                                            going.
                                        </p>
                                        <ol class="mt-6 space-y-4">
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/landscape-of-choice"
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
                                                                    >The
                                                                    Landscape of
                                                                    Choice</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >14:36</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                A practical map
                                                                for navigating
                                                                the illusion
                                                                that you
                                                                actually have
                                                                any agency at
                                                                all.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                14:36
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/paradox-of-agency"
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
                                                                    >The Paradox
                                                                    of Agency</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Explore whether
                                                                you're living
                                                                your life or
                                                                just reacting to
                                                                everyone else's.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/liberation-from-regret"
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
                                                                    >Liberation
                                                                    from Regret</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >15:47</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                If no
                                                                alternative
                                                                choice was ever
                                                                possible, regret
                                                                becomes
                                                                logically
                                                                unnecessary.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                15:47
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/recognizing-patterns"
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
                                                                    >Recognizing
                                                                    Patterns</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Failures weren't
                                                                freely chosen
                                                                but were
                                                                inevitable given
                                                                your
                                                                circumstances.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/values-and-goals"
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
                                                                    >Values and
                                                                    Goals</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >22:08</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Identify
                                                                patterns in your
                                                                interests and
                                                                abilities that
                                                                reveal your
                                                                predetermined
                                                                direction.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                22:08
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </section>
                            <section
                                id="direction"
                                class="grid grid-cols-4 border-t border-gray-950/10 dark:border-white/10"
                            >
                                <div class="col-span-full sm:col-span-1">
                                    <div
                                        class="-mt-px inline-flex border-t border-gray-950 pt-px dark:border-white"
                                    >
                                        <div
                                            class="pt-4 text-sm/7 font-semibold text-gray-950 sm:pt-10 dark:text-white"
                                        >
                                            Part 2
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="col-span-full pt-6 sm:col-span-3 sm:pt-10"
                                >
                                    <div class="max-w-2xl">
                                        <h2
                                            class="text-2xl/7 font-medium tracking-tight text-pretty text-gray-950 dark:text-white"
                                        >
                                            Direction: Choosing a Path
                                        </h2>
                                        <p
                                            class="mt-4 text-base/7 text-gray-700 sm:text-sm/7 dark:text-gray-400"
                                        >
                                            Experience the sensation of choice
                                            without the burden of true
                                            responsibility.
                                        </p>
                                        <ol class="mt-6 space-y-4">
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/mapping-causal-factors"
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
                                                                    >Mapping the
                                                                    Causal
                                                                    Factors</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >14:52</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                The causes
                                                                acting on you
                                                                can give you
                                                                insight into
                                                                where they might
                                                                take you.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                14:52
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/reframing-uncertainty"
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
                                                                    >Reframing
                                                                    Uncertainty
                                                                    as Agency</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                If you squint,
                                                                not being able
                                                                to predict the
                                                                future looks
                                                                sort of like
                                                                free will.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/decision-paralysis"
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
                                                                    >Overcoming
                                                                    Decision
                                                                    Paralysis</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                You can't be
                                                                paralysed by
                                                                choices you
                                                                don't actually
                                                                have.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/path-of-least-resistance"
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
                                                                    >Perceiving
                                                                    the Path of
                                                                    Least
                                                                    Resistance</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >19:07</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Recognizing
                                                                which direction
                                                                requires the
                                                                least
                                                                psychological
                                                                struggle.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                19:07
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/surrendering-outcome"
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
                                                                    >Surrendering
                                                                    to the
                                                                    Outcome</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >23:43</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Accepting that
                                                                whatever path
                                                                you choose has
                                                                no bearing on
                                                                where you'll go.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                23:43
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </section>
                            <section
                                id="navigation"
                                class="grid grid-cols-4 border-t border-gray-950/10 dark:border-white/10"
                            >
                                <div class="col-span-full sm:col-span-1">
                                    <div
                                        class="-mt-px inline-flex border-t border-gray-950 pt-px dark:border-white"
                                    >
                                        <div
                                            class="pt-4 text-sm/7 font-semibold text-gray-950 sm:pt-10 dark:text-white"
                                        >
                                            Part 3
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="col-span-full pt-6 sm:col-span-3 sm:pt-10"
                                >
                                    <div class="max-w-2xl">
                                        <h2
                                            class="text-2xl/7 font-medium tracking-tight text-pretty text-gray-950 dark:text-white"
                                        >
                                            Navigation: Steering Through the
                                            Inevitable
                                        </h2>
                                        <p
                                            class="mt-4 text-base/7 text-gray-700 sm:text-sm/7 dark:text-gray-400"
                                        >
                                            Techniques for aligning with your
                                            inevitable trajectory while avoiding
                                            nihilism.
                                        </p>
                                        <ol class="mt-6 space-y-4">
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/widening-field-of-view"
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
                                                                    >Widening
                                                                    Your Field
                                                                    of View</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >15:34</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                The universe can
                                                                be cruel and
                                                                it's important
                                                                to see that
                                                                coming.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                15:34
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/dealing-with-coincidence"
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
                                                                    >Dealing
                                                                    with
                                                                    Coincidence</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                If something
                                                                does go the way
                                                                you intended,
                                                                realize that
                                                                this was purely
                                                                coincidental.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/forgiving-others"
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
                                                                    >Forgiving
                                                                    Others</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                When actions are
                                                                beyond one's
                                                                control,
                                                                punishment is
                                                                illogical.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/anxiety-messages"
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
                                                                    >What
                                                                    Anxiety Is
                                                                    Trying to
                                                                    Tell You</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                A lack of
                                                                control can make
                                                                you anxious, but
                                                                realize this has
                                                                no bearing on
                                                                outcomes.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/maintaining-self"
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
                                                                    >Maintaining
                                                                    a Sense of
                                                                    Self</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Who you think
                                                                you are has been
                                                                assigned to you
                                                                by circumstance.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </section>
                            <section
                                id="destination"
                                class="grid grid-cols-4 border-t border-gray-950/10 dark:border-white/10"
                            >
                                <div class="col-span-full sm:col-span-1">
                                    <div
                                        class="-mt-px inline-flex border-t border-gray-950 pt-px dark:border-white"
                                    >
                                        <div
                                            class="pt-4 text-sm/7 font-semibold text-gray-950 sm:pt-10 dark:text-white"
                                        >
                                            Part 4
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="col-span-full pt-6 sm:col-span-3 sm:pt-10"
                                >
                                    <div class="max-w-2xl">
                                        <h2
                                            class="text-2xl/7 font-medium tracking-tight text-pretty text-gray-950 dark:text-white"
                                        >
                                            Destination: Arriving Where You Must
                                        </h2>
                                        <p
                                            class="mt-4 text-base/7 text-gray-700 sm:text-sm/7 dark:text-gray-400"
                                        >
                                            How to be content with the
                                            inconsequential destiny you've been
                                            given.
                                        </p>
                                        <ol class="mt-6 space-y-4">
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/reframing-achievement"
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
                                                                    >Reframing
                                                                    Achievement
                                                                    and Failure</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Pride and regret
                                                                are just
                                                                psychological
                                                                coping
                                                                mechanisms.
                                                            </p>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/surrendering-to-success"
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
                                                                    >Surrendering
                                                                    to Success</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >20:47</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Achievements
                                                                reveal
                                                                capabilities
                                                                that were always
                                                                present rather
                                                                than self
                                                                development.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                20:47
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/giving-credit"
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
                                                                    >Giving
                                                                    Credit Where
                                                                    it's Due</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >16:07</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                Recognize the
                                                                broader system
                                                                that produced
                                                                your
                                                                achievement.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                16:07
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/unburden-accountability"
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
                                                                    >Unburden
                                                                    Yourself
                                                                    from
                                                                    Accountability</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >18:43</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                When things
                                                                haven't gone
                                                                your way, it
                                                                literally
                                                                couldn't have
                                                                been your fault.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                18:43
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="flow-root">
                                                    <a
                                                        class="-mx-3 -my-2 flex gap-3 rounded-xl px-3 py-2 text-sm/7 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                                        href="/writing-autobiography"
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
                                                                    >Exercise:
                                                                    Writing your
                                                                    autobiography</span
                                                                ><span
                                                                    class="mx-2 hidden text-gray-950/25 sm:inline dark:text-white/25"
                                                                    >·</span
                                                                ><span
                                                                    class="hidden text-gray-500 sm:inline"
                                                                    >24:46</span
                                                                >
                                                            </div>
                                                            <p
                                                                class="text-gray-700 dark:text-gray-400"
                                                            >
                                                                A way to come to
                                                                grips with your
                                                                inconsequence.
                                                            </p>
                                                            <div
                                                                class="text-gray-500 sm:hidden"
                                                            >
                                                                24:46
                                                            </div>
                                                        </div></a
                                                    >
                                                </div>
                                            </li>
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
