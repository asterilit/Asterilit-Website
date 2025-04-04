<script lang="ts">
	let isOpen = false;
</script>

<nav class="fixed z-50 flex h-20 w-screen flex-row items-center justify-between bg-[linear-gradient(180deg,_black_15%,_transparent_100%)] px-4">
	<div class="h-full flex items-center">
		<a href="/" draggable="false" class="aspect-square max-h-full">
			<img src="/images/logo.svg" alt="Asterilit logo" draggable="false" class="h-full select-none" />
		</a>
	</div>

	<ul class="desktop-nav hidden md:flex justify-around h-full w-1/2 items-center space-x-8">
		<li>
            <a href="#project" class="text-white sm:text-lg lg:text-xl xl:text-2xl">
                project
            </a>
        </li>
		<li>
            <a href="#about" class="text-white sm:text-lg lg:text-xl xl:text-2xl">
                about us
            </a>
        </li>
		<li>
            <a href="#contact" class="text-white sm:text-lg lg:text-xl xl:text-2xl">
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
	<ul class="md:hidden fixed pt-20 z-40 w-full flex flex-col items-center gap-6 bg-black bg-opacity-80 py-6">
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

<style lang="scss">
    .desktop-nav {
        a {
            position: relative;
            &::after {
                content: "";
                position: absolute;
                left: 50%; 
                top: 55%; 
                width: 0;
                height: 2px;
                background-color: #00FF00;
                transition: width 0.15s ease-in-out;
                transform: translate(-50%, -50%);
            }
            &:hover::after {
                width: 100%;
            }
        }
    }
</style>