<script lang="ts">
    import Button from "$lib/components/Button copy.svelte";
    let count = 0;

    function handleClick() {
        count += 1;
    }
</script>

<h1>Welcome to SvelteKit</h1>
<p>This is a button</p>

<Button on:click={handleClick}>
    Clicked {count}
    {count === 1 ? "time" : "times"}
</Button>

<p>
    Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the
    documentation
</p>
