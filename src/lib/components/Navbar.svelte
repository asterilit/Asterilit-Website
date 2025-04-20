<script lang="ts">
	let isOpen = false;
</script>

<nav
	class="fixed z-50 flex h-20 w-screen flex-row items-center justify-between bg-gradient-to-b from-black via-black to-transparent px-4"
>
	<div class="flex h-full items-center">
		<a href="/" draggable="false" class="aspect-square max-h-full">
			<img
				src="/images/logo.svg"
				alt="Asterilit logo"
				draggable="false"
				class="h-full select-none"
			/>
		</a>
	</div>

	<ul class="desktop-nav hidden h-full w-1/2 items-center justify-around space-x-8 md:flex">
		<li>
			<a href="#projects" class=" sm:text-lg lg:text-xl xl:text-2xl"> projects </a>
		</li>
		<li>
			<a href="#about" class=" sm:text-lg lg:text-xl xl:text-2xl"> about us </a>
		</li>
		<li>
			<a href="#contact" class=" sm:text-lg lg:text-xl xl:text-2xl"> contact </a>
		</li>
	</ul>

	<!-- Mobile Menu Button -->
	<button class="text-3xl focus:outline-none md:hidden" on:click={() => (isOpen = !isOpen)}>
		{#if isOpen}
			&times;
		{:else}
			&#9776;
		{/if}
	</button>
</nav>

<!-- Mobile Menu -->
{#if isOpen}
	<ul
		class="bg-opacity-80 fixed z-40 flex w-full flex-col items-center gap-6 bg-black py-6 pt-20 md:hidden"
	>
		<li>
			<a href="#projects" class="text-xl" on:click={() => (isOpen = false)}> projects</a>
		</li>
		<li>
			<a href="#about" class="text-xl" on:click={() => (isOpen = false)}> about us </a>
		</li>
		<li>
			<a href="#contact" class="text-xl" on:click={() => (isOpen = false)}> contact</a>
		</li>
	</ul>
{/if}

<style lang="scss">
	.desktop-nav {
		a {
			position: relative;
			&::after {
				content: '';
				position: absolute;
				left: 50%;
				top: 55%;
				width: 0;
				height: 2px;
				background-color: #00ff00;
				transition: width 0.15s ease-in-out;
				transform: translate(-50%, -50%);
			}
			&:hover::after {
				width: 100%;
			}
		}
	}
</style>
