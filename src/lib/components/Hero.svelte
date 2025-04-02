<script lang="ts">
    import { onMount } from "svelte";

	function getRandomHex() {
		return Math.floor(Math.random() * 256)
			.toString(16)
			.padStart(2, '0');
	}

	let hexValues: string[] = Array(9).fill('').map(getRandomHex);

	onMount(() => {
		hexValues = hexValues.map(() => getRandomHex());

		hexValues.forEach((_, i) => {
			setInterval(
				() => {
					hexValues[i] = getRandomHex();
				},
				Math.random() * 2000 + 1000
			);
		});
	});

    const textData = [
		{ letter: 'A', binary: '01100001' },
		{ letter: 'S', binary: '01110011' },
		{ letter: 'T', binary: '01110100' },
		{ letter: 'E', binary: '01100101' },
		{ letter: 'R', binary: '01110010' },
		{ letter: 'I', binary: '01101001' },
		{ letter: 'L', binary: '01101100' },
		{ letter: 'I', binary: '01101001' },
		{ letter: 'T', binary: '01110100' }
	];
</script>

<main class="flex h-screen w-screen bg-black">
	<!-- ⏲️ hex grid -->
	<section class="grid-wrapper flex h-full w-1/3 items-center justify-center pt-36">
		<div
			class="grid aspect-square w-1/3 grid-cols-3 bg-[linear-gradient(135deg,_#00FF00_10%,_blue_100%)] bg-clip-text text-transparent"
		>
			{#each hexValues as hex (hex)}
				<div class="cell transition-fade text-4xl font-bold">{hex}</div>
			{/each}
		</div>
	</section>

	<!-- 🚮 Binary -->
	<section
		class="flex h-full w-1/3 flex-col items-center justify-center gap-1.5 bg-[linear-gradient(180deg,_white_10%,_blue_100%)] bg-clip-text text-transparent"
	>
		{#each textData as item (item)}
			<p class="text-4xl font-semibold">
				{item.letter}
				{item.binary}
			</p>
		{/each}
	</section>

	<section class="flex h-full w-1/3 flex-col items-center justify-end gap-2 pb-2">
		<h2 class="text-4xl text-white">ASTERILIT</h2>
		<img src="/icons/ASTERILIT.svg" alt="asterilit as barcode" class="h-10" />
	</section>
</main>

<style lang="css">
    .grid {
		transition: transform 0.5s ease-in-out;
	}

	.cell {
		transition:
			color 0.3s ease,
			transform 0.3s ease;
	}
</style>