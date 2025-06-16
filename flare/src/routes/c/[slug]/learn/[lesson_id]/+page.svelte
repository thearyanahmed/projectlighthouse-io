<script lang="ts">
    import { marked, type Tokens } from "marked";
    import type { PageProps } from "./$types";

    const { data }: PageProps = $props();

    interface Heading {
        text: string;
        id: string;
        level: number;
    }

    let headings: Heading[] = [];
    let slugCounts = new Map<string, number>();

    function slugify(text: string): string {
        let slug = text
            .toLowerCase()
            .trim()
            .replace(/[^a-z0-9\s]/g, "")
            .replace(/\s+/g, "-");

        const count = slugCounts.get(slug) ?? 0;
        slugCounts.set(slug, count + 1);
        if (count > 0) slug += `-${count}`;

        return slug;
    }

    const renderer = {
        heading({ tokens, depth }: Tokens.Heading): string {
            const text = tokens
                .map((t) => t.raw)
                .join("")
                .trim();
            const id = slugify(text);
            headings.push({ text, id, level: depth });
            return `<h${depth} id="${id}">${text}</h${depth}>`;
        },
    };

    marked.use({ renderer });

    slugCounts.clear();
    headings = [];

    let renderedContent: string | null = data.lesson?.content
        ? (marked.parse(data.lesson.content) as string)
        : null;
</script>

<div class="px-4 sm:px-6">
    <div class="mx-auto max-w-7xl">
        <div class="-mx-2 sm:-mx-4">
            <div
                class="group aspect-video w-full rounded-2xl bg-gray-950 dark:bg-gray-900"
            >
                <video
                    id="video"
                    src="https://assets.tailwindcss.com/templates/compass/landscape-of-choice.mp4"
                    poster="https://assets.tailwindcss.com/templates/compass/lesson-video-thumbnail-01.png"
                    preload="metadata"
                    controls=""
                    class="aspect-video w-full rounded-2xl sm:group-data-offscreen:data-playing:fixed sm:group-data-offscreen:data-playing:right-4 sm:group-data-offscreen:data-playing:bottom-4 sm:group-data-offscreen:data-playing:z-10 sm:group-data-offscreen:data-playing:max-w-md sm:group-data-offscreen:data-playing:rounded-xl sm:group-data-offscreen:data-playing:shadow-lg"
                ></video>
            </div>
        </div>
        <div
            class="mx-auto flex max-w-2xl gap-x-10 py-10 sm:py-14 lg:max-w-5xl"
        >
            {#if data.course}
                <div class="w-full flex-1">
                    <div id="content" class="prose">
                        <h1 id="mapping-the-causal-factors">
                            {data.lesson?.name}
                        </h1>

                        <div id="lesson-content">
                            {#if renderedContent}
                                {@html renderedContent}
                            {:else if data.lesson?.content === null}
                                <p>No content provided for this lesson.</p>
                            {:else}
                                <p>Loading content...</p>
                            {/if}
                        </div>
                    </div>
                    <div
                        class="mt-16 border-t border-gray-200 pt-8 dark:border-white/10"
                    >
                        <div class="flow-root">
                            <a
                                class="-mx-3 -my-2 block rounded-xl px-3 py-2 hover:bg-gray-950/4 dark:hover:bg-white/5"
                                href="/reframing-uncertainty"
                                ><p
                                    class="flex items-center gap-3 text-sm/7 text-gray-500"
                                >
                                    Up next<svg
                                        viewBox="0 0 5 8"
                                        fill="none"
                                        class="stroke-current h-2 shrink-0"
                                        ><path
                                            d="M1 7.5L4 4.5L1 1.5"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                        ></path></svg
                                    >
                                </p>
                                <p
                                    class="mt-3 text-base/7 font-medium text-gray-950 dark:text-white"
                                >
                                    Reframing Uncertainty as Agency
                                </p>
                                <p
                                    class="text-sm/7 text-gray-700 dark:text-gray-400"
                                >
                                    If you squint, not being able to predict the
                                    future looks sort of like free will.
                                </p></a
                            >
                        </div>
                    </div>
                </div>
                <div class="hidden w-66 lg:block">
                    <nav class="sticky top-16">
                        <h2
                            class="text-sm/6 font-semibold text-gray-950 dark:text-white"
                        >
                            On this page
                        </h2>
                        <ul
                            class="mt-3 flex flex-col gap-3 border-l border-gray-950/10 text-sm/6 text-gray-700 dark:border-white/10 dark:text-gray-400"
                        >
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#the-illusion-of-navigation"
                                    class="block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    aria-current="location"
                                    >The Illusion of Navigation</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#identifying-your-causal-factors"
                                    class="block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >Identifying Your Causal Factors</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#internal-causal-factors"
                                    class="pl-4 block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >Internal Causal Factors</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#external-causal-factors"
                                    class="pl-4 block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >External Causal Factors</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#mapping-your-causal-terrain"
                                    class="block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >Mapping Your Causal Terrain</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#1-track-your-automatic-responses"
                                    class="pl-4 block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >1. Track Your Automatic Responses</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#2-identify-your-environmental-triggers"
                                    class="pl-4 block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >2. Identify Your Environmental Triggers</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#3-recognize-your-decision-patterns"
                                    class="pl-4 block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >3. Recognize Your Decision Patterns</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#4-notice-your-attention-allocation"
                                    class="pl-4 block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >4. Notice Your Attention Allocation</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#case-study-the-career-transition"
                                    class="block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >Case Study: The Career Transition</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#predicting-your-inevitable-path"
                                    class="block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >Predicting Your Inevitable Path</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#working-with-your-causal-factors-not-against-them"
                                    class="block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >Working With Your Causal Factors, Not
                                    Against Them</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#the-strange-comfort-of-causal-clarity"
                                    class="block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >The Strange Comfort of Causal Clarity</a
                                >
                            </li>
                            <li
                                class="-ml-px border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=location]:border-gray-400 dark:hover:text-white has-aria-[current=location]:border-gray-950 dark:has-aria-[current=location]:border-white"
                            >
                                <a
                                    href="#next-steps"
                                    class="block aria-[current=location]:font-medium aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white"
                                    >Next Steps</a
                                >
                            </li>
                        </ul>
                    </nav>
                </div>
            {:else}
                <div>
                    <!-- todo: update this portion -->
                    Not found.
                </div>
            {/if}
        </div>
    </div>
</div>
