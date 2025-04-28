<script lang="ts">
	let laisohover = false;
	let lchover = false;
</script>

<section id="about" class="relative flex h-screen w-screen flex-row bg-black">
	<article class="left z-50 flex h-full w-1/2 flex-row">
		<div class="flex h-full w-1/2 items-center">
			<img
				src="/images/laiso.png"
				alt=""
				draggable="false"
				class="transition-transform duration-300 ease-out {laisohover ? '' : '-translate-x-1/2'}"
			/>
		</div>

		<div class="flex h-full w-1/2 flex-col justify-center pl-10">
			<div
				class="title-wrapper flex w-full justify-end"
				on:mouseenter={() => (laisohover = true)}
				on:mouseleave={() => (laisohover = false)}
				role="none"
			>
				<h3 class="text-4xl">laiso</h3>
			</div>
			<p class="text-end">Lorem ipsum dolor sit</p>
		</div>
	</article>

	<article class="left z-50 flex h-full w-1/2 flex-row">
		<div class="flex h-full w-1/2 flex-col justify-center pl-10">
			<div
				class="title-wrapper w-full"
				on:mouseenter={() => (lchover = true)}
				on:mouseleave={() => (lchover = false)}
				role="none"
			>
				<h3 class="text-4xl">LIKE_Creep</h3>
			</div>
			<p>Lorem ipsum dolor sit</p>
		</div>

		<div class="flex h-full w-1/2 items-center justify-end">
			<img
				src="/images/likecreep.png"
				alt=""
				draggable="false"
				class="transition-transform duration-300 {lchover ? '' : 'translate-x-1/2'}"
			/>
		</div>
	</article>

	<div class="images-wrapper absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
		<img src="/images/logo.svg" alt="" class="scale-70 opacity-40" draggable="false" />
	</div>
</section>

<style lang="scss">
</style>
