<script lang="ts">
	let isOpen = false;
</script>

<nav class="fixed z-50 flex h-20 w-screen flex-row items-center justify-between bg-[linear-gradient(180deg,_black_15%,_transparent_100%)] px-4">
	<div class="h-full flex items-center">
		<a href="/" draggable="false" class="aspect-square max-h-full">
			<img src="/images/logo.svg" alt="Asterilit logo" draggable="false" class="h-full select-none" />
		</a>
	</div>

	<ul class="hidden md:flex h-full items-center space-x-8">
		<li>
            <a href="#project" class="text-white text-lg hover:underline">
                project
            </a>
        </li>
		<li>
            <a href="#about" class="text-white text-lg hover:underline">
                about us
            </a>
        </li>
		<li>
            <a href="#contact" class="text-white text-lg hover:underline">
                contact
            </a>
        </li>
	</ul>

	<!-- Mobile Menu Button -->
	<button class="md:hidden text-white text-3xl focus:outline-none" on:click={() => (isOpen = !isOpen)}>
		{#if isOpen}
			&times;
		{:else}
			&#9776;
		{/if}
	</button>
</nav>

<!-- Mobile Menu -->
{#if isOpen}
	<ul class="md:hidden absolute top-20 left-0 z-40 w-full flex flex-col items-center gap-6 bg-black bg-opacity-80 py-6">
		<li>
            <a 
                href="#project" 
                class="text-white text-xl" 
                on:click={() => (isOpen = false)}>
                project</a
                >
        </li>
		<li>
            <a 
                href="#about" 
                class="text-white text-xl" 
                on:click={() => (isOpen = false)}>
                about us
            </a>
        </li>
		<li>
            <a 
                href="#contact" 
                class="text-white text-xl" 
                on:click={() => (isOpen = false)}>
                contact</a
                >
        </li>
	</ul>
{/if}
