<script lang="ts">
    import { marked, type Tokens } from "marked";
    import type { PageProps } from "./$types";
    const { data }: PageProps = $props();
    interface Heading {
        text: string;
        id: string;
        level: number;
        is_child: boolean;
    }

    // svelte-ignore non_reactive_update
    let headings: Heading[] = [];
    let slugCounts = new Map<string, number>();
    function escapeHtml(html: string): string {
        return html
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#39;");
    }
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

            headings.push({
                text,
                id,
                level: depth,
                is_child: depth > 2, // h3+ treated as child
            });
            return `<h${depth} id="${id}">${text}</h${depth}>`;
        },
        code({ lang, text }: Tokens.Code): string {
            const langClass = lang ? `language-${lang}` : "";
            return `<pre><code class="${langClass}">${escapeHtml(text)}</code></pre>`;
        },
    };

    marked.use({ renderer });

    slugCounts.clear();
    headings = [];

    let renderedContent: string | null = data.lesson?.content
        ? (marked.parse(data.lesson.content) as string)
        : null;
</script>

<div class="mt-10 px-4 sm:px-6">
    <div class="mx-auto max-w-7xl">
        <div class="-mx-2 sm:-mx-4">
            <div
                class="group aspect-video w-full rounded-2xl bg-gray-950 dark:bg-gray-900"
            >
                <!-- svelte-ignore a11y_media_has_caption -->
                <video
                    id="video"
                    src="https://assets.tailwindcss.com/templates/compass/landscape-of-choice.mp4"
                    poster="https://assets.tailwindcss.com/templates/compass/lesson-video-thumbnail-01.png"
                    preload="metadata"
                    controls="false"
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
                                <div class="text-lg markdown-body">
                                    {@html renderedContent}
                                </div>
                            {:else if data.lesson?.content === null}
                                <p>No content provided for this lesson.</p>
                            {:else}
                                <p>Loading content...</p>
                            {/if}
                        </div>
                    </div>
                    <!-- <div
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
                    </div> -->
                </div>
                <div class="hidden w-66 lg:block">
                    <nav class="sticky top-16">
                        <h2
                            class="text-sm/6 font-semibold text-gray-950 dark:text-white"
                        >
                            On this page
                        </h2>

                        <ul
                            class="border-l border-gray-950/10 mt-3 flex flex-col gap-3 text-sm/6 text-gray-500 dark:border-white/10 dark:text-gray-400"
                        >
                            {#each headings as h}
                                <li
                                    class="-ml-px border-l border-transparent dark:hover:text-white dark:has-aria-[current=location]:border-white"
                                >
                                    <a
                                        href={`#${h.id}`}
                                        class={`pl-4 block aria-[current=location]:font-regular aria-[current=location]:text-gray-950 dark:aria-[current=location]:text-white${h.is_child ? " pl-8" : ""}`}
                                        aria-current="location"
                                    >
                                        {h.text}
                                    </a>
                                </li>
                            {/each}
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
