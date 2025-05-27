<script lang="ts">
    import type { PageProps } from "./$types";

    let { data }: PageProps = $props();
</script>

<div>
    Title is : {data.lesson.title}
    Current API health status (coming from api)
    <span
        class="p-2 rounded-md text-white"
        class:bg-green-600={data.health.status === "ok"}
        class:bg-red-600={data.health.status !== "ok"}
    >
        {data.health.status}
    </span>
</div>
