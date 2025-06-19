<script lang="ts">
    import Button from "$lib/components/Button.svelte";
    let count = 0;

    function handleClick() {
        count += 1;
    }
</script>

<div class="flex flex-col items-center justify-center min-h-screen">
    <div class="flex w-full max-w-4xl">
        <div class="w-1/2 p-4">
            <div>
                <span> /'lighthouse/ </span>
            </div>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam similique
            in assumenda asperiores obcaecati molestiae aliquam unde? At quibusdam
            ipsum consequuntur iusto fugiat obcaecati quas architecto quos saepe,
            corporis debitis?
        </div>
        <div class="w-1/2 p-4 flex items-center justify-center">
            <!-- Add your content for the second half here -->
            <span>Second half</span>
        </div>
    </div>
</div>
