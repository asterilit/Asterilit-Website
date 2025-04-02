<script lang="ts">
	import { fade, slide, fly } from 'svelte/transition';

	type Project = {
		name: string;
		description: string;
		image: string;
	};

	const projects: Project[] = [
		{
			name: 'Vanyard',
			description: 'Sigma Sigma boy Sigma boy Sigma boy Sigma Sigma boy Sigma boy',
			image: '/images/xcub-project.png'
		},
		{
			name: 'Xcub',
			description: 'Sigma Sigma boy Sigma boy Sigma boy ',
			image: '/images/xcub-project.png'
		}
	];

	let selectedProject: Project | null = null;

	function selectProject(project: Project) {
		selectedProject = project;
	}

	function clearProject() {
		selectedProject = null;
	}
</script>

<section id="project" class="flex h-screen w-screen flex-row bg-black">
	<!-- 🟢 Left Side: Project List -->
	<article class="h-full w-1/3">
		<ul class="project-wrapper flex h-full w-full flex-col justify-around gap-5">
			{#each projects as project, index (index)}
				<li
					class="m-4 flex h-20 flex-row items-center gap-5 border-b-2 p-2"
					on:mouseenter={() => selectProject(project)}
					on:mouseleave={clearProject}
				>
					<img src="/icons/prompt.svg" alt="" class="h-12" />
					<p class="text-2xl text-white">{project.name}</p>
				</li>
			{/each}
		</ul>
	</article>

	<!-- 🔵 Right Side: Project Details -->
	{#if selectedProject}
		<article
			class="project-preview flex h-full w-2/3 flex-col items-center justify-center p-8 text-center text-white"
			in:fade={{ duration: 400 }}
			out:fade={{ duration: 500 }}
		>
			<h2 class="inline text-5xl font-bold" in:slide={{ axis: 'y', duration: 300 }}>
				{selectedProject.name}
			</h2>

			<p class="mt-4 inline max-w-2xl text-lg" in:fade={{ duration: 400, delay: 100 }}>
				{selectedProject.description}
			</p>

			<img
				src={selectedProject.image}
				alt={selectedProject.description}
				class="mt-6 inline h-auto w-1/2 rounded-lg shadow-lg"
				in:fly={{ duration: 200, y: 100, delay: 150, opacity: 0 }}
				out:fly={{ duration: 150, x: 70, delay: 100 }}
			/>
		</article>
	{/if}
</section>

<style lang="scss">
	.project-wrapper {
		li {
			position: relative;
			padding-bottom: 1em;
			transition: all 0.3s cubic-bezier(0, 1.5, 1, 1.5);

			&:hover {
				cursor: pointer;
				gap: 2em;
				padding-left: 1em;

				&::after {
					background: linear-gradient(90deg, white 20%, blue 70%, black 100%);
				}
			}

			&::after {
				content: '';
				position: absolute;
				bottom: 0;
				left: 0;
				width: 100%;
				height: 2px;
				background: linear-gradient(90deg, white 0%, blue 50%, black 100%);
			}
		}
	}
</style>
