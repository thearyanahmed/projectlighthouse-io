<script lang="ts">
	import CoursePageTopNavbar from "$lib/components/CoursePageTopNavbar.svelte";
	import TopBarBreadcrumb from "$lib/components/TopBarBreadcrumb.svelte";
	import "../app.css";
	import "../globals.css";
</script>

<div class="isolate">
	<div class="group">
		<div class="max-w-5xl mx-auto">
			<div
				class="sticky top-0 z-10 backdrop-blur-sm flex items-center gap-x-8 px-4 py-4 sm:px-6"
			>
				<div class="flex min-w-0 shrink items-center gap-x-4">
					<button
						type="button"
						aria-label="Toggle sidebar"
						class="xl:hidden relative *:relative before:absolute before:top-1/2 before:left-1/2 before:size-8 before:-translate-1/2 before:rounded-md before:bg-white/75 before:backdrop-blur-sm dark:before:bg-gray-950/75 data-hover:before:bg-gray-950/5 dark:data-hover:before:bg-white/5 focus:outline-hidden data-focus:before:outline-2 data-focus:before:outline-blue-700 data-focus:before:outline-solid"
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
					<div class="min-w-0">
						<!-- this is the logo -->
						<TopBarBreadcrumb />
					</div>
				</div>

				<nav class="flex items-center">
					<div class="flex gap-x-6 text-sm/6 text-gray-950">
						<a href="/resources">Resources</a>
						{#if false}
							<button
								class="inline-flex items-center gap-x-2 focus:not-data-focus:outline-none"
								id="headlessui-menu-button-«r10»"
								type="button"
								aria-haspopup="menu"
								aria-expanded="false"
								data-headlessui-state=""
								>Account<svg
									viewBox="0 0 8 4"
									fill="none"
									class="stroke-gray-950 dark:stroke-white h-1 shrink-0"
									><path
										fill="none"
										d="M1 0.5L4 3.5L7 0.5"
										stroke-linecap="round"
										stroke-linejoin="round"
									></path></svg
								></button
							>
						{/if}
					</div>
				</nav>
			</div>

			<main class="px-4 sm:px-6">
				<div class="relative mx-auto max-w-7xl">
					<slot />
				</div>
			</main>
		</div>
	</div>
</div>
