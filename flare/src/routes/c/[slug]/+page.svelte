<script lang="ts">
    import type { PageProps } from "./$types";

    let { data }: PageProps = $props();
</script>

<div>
    Current API health status (coming from api)
    {#if data.error}
        <span class="p-2 rounded-md bg-red-700 text-white"
            >{data.error.message}</span
        >
    {:else if data.health}
        <span
            class="p-2 rounded-md text-white"
            class:bg-green-600={data.health.status === "ok"}
            class:bg-red-600={data.health.status !== "ok"}
        >
            {data.health.status}
        </span>
    {:else}
        <span class="p-2 rounded-md bg-gray-400 text-white"> Unknown </span>
    {/if}
</div>
