<script lang="ts">
	import { onMount } from 'svelte';
    import { fade } from 'svelte/transition';

	let words: string[] = ['hello', 'word', 'xcub', 'vanyard', 'asterilit', 'oafa', 'ganshi', 'dravin', '02/03/24'];

	function wordToHexGrid(word: string): string[] {
		const encoder = new TextEncoder();
		let hex = Array
            .from(encoder.encode(word))
            .map((b) => b.toString(16).padStart(2, '0'));

        if (hex.length < 9) {
            while (hex.length < 8) {
                hex.unshift("00")
            };
		    hex.unshift('0x');
        } else {
            return [
                "0x","00","00", 
                "00","00","00",
                "00","00","00"
            ];
        };
		return hex;
	};

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
		{ letter: 'A', binary: '01100001', id: 1 },
		{ letter: 'S', binary: '01110011', id: 2 },
		{ letter: 'T', binary: '01110100', id: 3 },
		{ letter: 'E', binary: '01100101', id: 4 },
		{ letter: 'R', binary: '01110010', id: 5 },
		{ letter: 'I', binary: '01101001', id: 6 },
		{ letter: 'L', binary: '01101100', id: 7 },
		{ letter: 'I', binary: '01101001', id: 8 },
		{ letter: 'T', binary: '01110100', id: 9 }
	];
</script>

<main class="flex h-screen w-screen bg-black">
	<!-- ⏲️ hex grid -->
	<section class="grid-wrapper flex h-full w-1/3 items-center justify-center pt-36">
		<div
			class="grid aspect-square w-1/3 grid-cols-3 bg-[linear-gradient(135deg,_#00FF00_10%,_blue_100%)] bg-clip-text text-transparent"
		>
			{#each hexValues as hex, index (index)}
				<div 
                    class="cell transition-fade text-4xl font-bold"
                    in:fade={{ duration: 100 }}
                    out:fade={{ duration: 100 }}>
                    {hex}
                </div>
			{/each}
		</div>
	</section>

	<!-- 🚮 Binary -->
	<section
		class="flex h-full w-1/3 flex-col items-center justify-center gap-1.5 bg-[linear-gradient(180deg,_white_10%,_blue_100%)] bg-clip-text text-transparent"
	>
		{#each textData as item (item.id)}
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
