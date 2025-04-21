<script lang="ts">
</script>

<footer class="flex h-[40svh] w-screen flex-row bg-black">
	<section class="flex h-full w-2/5 flex-col items-center justify-center gap-10">
		<a href="/">
			<img src="/images/logo.svg" alt="Asterilit logo" class="h-[15svh]" draggable="false" />
		</a>
		<img
			src="/icons/ASTERILIT.svg"
			alt="asterilit as bar code"
			class="h-[5svh]"
			draggable="false"
		/>
	</section>

	<section class="h-full w-1/5"></section>
	<section class="flex h-full w-1/5 flex-col gap-20">
		<ul class="pl-5">
			<li class=" text-xl">
				<a href="#projects">projects</a>
			</li>
			<li class=" text-xl">
				<a href="#about">about</a>
			</li>
			<li class=" text-xl">
				<a href="#contact">contact</a>
			</li>
		</ul>
	</section>
	<section class="flex h-full w-1/5 flex-col">
		<ul class="pl-5">
			<li class=" text-xl">
				<a href="#projects">discord</a>
			</li>
			<li class=" text-xl">
				<a href="#about">instagram</a>
			</li>
			<li class=" text-xl">
				<a href="#contact">bluesky</a>
			</li>
			<li class=" text-xl">
				<a href="#contact">github</a>
			</li>
		</ul>
	</section>
</footer>

<style lang="scss">
	section {
		a {
			&:hover {
				text-decoration: underline;
			}
		}

		&:not(:nth-child(1)) {
			background-position: 0% 50% !important;
			background-repeat: no-repeat;
			background-size: cover;
		}

		&:nth-child(2) {
			background-image: url('/images/footer/bg-1.png');
		}

		&:nth-child(3) {
			background-image: url('/images/footer/bg-2.png');
		}

		&:nth-child(4) {
			background-image: url('/images/footer/bg-3.png');
		}
	}
</style>
