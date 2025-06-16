<script lang="ts">
    import type { PageProps } from "./$types";

    let { data }: PageProps = $props();

    console.log("data", data);
</script>

<div>
    <div class="flex flex-col gap-4">
        <h1 class="text-2xl font-bold text-gray-950 dark:text-white">HI</h1>
    </div>
</div>
