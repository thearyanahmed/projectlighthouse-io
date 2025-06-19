<script lang="ts">
	import LeftSidebar from "$lib/components/LeftSidebar.svelte";
	import "../../../app.css";
	import "../../../globals.css";
	import type { LayoutProps } from "./$types";

	let { data, children }: LayoutProps = $props();
</script>

<div>
	<LeftSidebar>
		{#if data.course?.lessons && data.course.lessons.length > 0}
			<div>
				<!-- <h2
						class="text-base/7 font-semibold text-pretty text-gray-950 sm:text-sm/6 dark:text-white"
					>
						{module.name}
					</h2> -->
				<ul
					class="mt-4 flex flex-col gap-4 border-l border-gray-950/10 text-base/7 text-gray-700 sm:mt-3 sm:gap-3 sm:text-sm/6 dark:border-white/10 dark:text-gray-400"
				>
					{#each data.course?.lessons as lesson}
						<li
							class="-ml-px flex border-l border-transparent pl-4 hover:text-gray-950 hover:not-has-aria-[current=page]:border-gray-400 dark:hover:text-white has-aria-[current=page]:border-gray-950 dark:has-aria-[current=page]:border-white"
						>
							<a
								class="aria-[current=page]:font-medium aria-[current=page]:text-gray-950 dark:aria-[current=page]:text-white"
								href={`/c/${data.course.slug}/learn/${lesson.id}/#${lesson.name
									.replace(/\s+/g, "-")
									.toLowerCase()}`}
								data-sveltekit-preload-data="off"
							>
								{lesson.name}
							</a>
						</li>
					{/each}
				</ul>
			</div>
		{:else}
			<div></div>
		{/if}
	</LeftSidebar>

	{@render children()}
</div>
