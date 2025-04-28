<script lang="ts">
	import { onMount } from 'svelte';

	let words: string[] = [
		// Asterilit
		'est010425',
		'asterilit',
		// XCUB
		'GussDX',
		'XCUB',
		'Oafa',
		'Ganshi',
		'Dravin',
		'est030324',
		'Blanchete',
		// Vanyard
		'Vanyard',
		'Stardust'
	];

	function wordToHexGrid(word: string): string[] {
		const encoder = new TextEncoder();
		let hex = Array.from(encoder.encode(word)).map((b) => b.toString(16).padStart(2, '0'));

		if (hex.length === 9) return hex;

		if (hex.length < 9) {
			while (hex.length < 8) {
				hex.unshift('00');
			}

			hex.unshift('0x');
		}

		return hex;
	}

	let hexValues: string[] = wordToHexGrid(words[0]);

	onMount(() => {
		setInterval(
			() => {
				const randomWord = words[Math.floor(Math.random() * words.length)];
				hexValues = wordToHexGrid(randomWord);
			},
			Math.random() * 2000 + 1000
		);
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
			{#each hexValues as hex, index (hex + index)}
				<div class="cell flex h-16 w-16 items-center justify-center font-bold sm:text-lg md:text-xl lg:text-2xl xl:text-4xl">
					{hex}
				</div>
			{/each}
		</div>
	</section>

	<!-- 🚮 Binary -->
	<section class="flex h-full w-1/3 items-center justify-center">
		<div
			class="flex flex-col gap-2 bg-[linear-gradient(180deg,_white_5%,_blue_100%)] bg-clip-text text-transparent"
		>
			{#each textData as item, index (index)}
				<p class="font-semibold sm:text-lg md:text-xl lg:text-2xl xl:text-4xl">
					{item.letter}
					{item.binary}
				</p>
			{/each}
		</div>
	</section>

	<section class="flex h-full w-1/3 flex-col items-end justify-end">
		<div class="flex flex-col items-center justify-end gap-2 pr-8 pb-8">
			<h1 class="text-4xl">ASTERILIT</h1>
			<img src="/icons/ASTERILIT.svg" alt="asterilit as barcode" class="h-10" draggable="false" />
		</div>
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
