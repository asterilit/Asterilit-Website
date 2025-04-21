<script lang="ts">
	import { fade, fly } from 'svelte/transition';

	type Project = {
		name: string;
		description: string;
	};

	const projects: Project[] = [
		{
			name: 'Vanyard',
			description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab, corrupti?'
		},
		{
			name: 'Xcub',
			description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab, corrupti?'
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

<section id="projects" class="flex h-screen w-screen flex-row bg-black">
	<!-- 🟢 Left Side: Project List -->
	<article class="h-full w-1/3">
		<ul class="project-wrapper flex h-full w-full flex-col justify-evenly">
			{#each projects as project, index (index)}
				<li
					class="m-4 flex h-20 flex-row items-center gap-5 border-b-2 p-2"
					on:mouseenter={() => selectProject(project)}
					on:mouseleave={clearProject}
				>
					<img src="/icons/prompt.svg" alt="" class="h-12 select-none" />
					<p class="text-2xl text-white">{project.name}</p>
				</li>
			{/each}
		</ul>
	</article>

	<!-- 🔵 Right Side: Project Details -->
	{#if selectedProject}
		<article
			class="project-preview flex h-full w-2/3 flex-col items-center justify-center p-8 text-center"
			out:fade={{ duration: 500 }}
		>
			<img
				src={`/images/${selectedProject.name.toLowerCase()}/logo.png`}
				alt={selectedProject.description}
				class="mt-6 inline aspect-auto h-[20svh] rounded-lg shadow-lg select-none"
				in:fly={{ duration: 200, y: 100, delay: 100, opacity: 0 }}
				out:fly={{ duration: 150, x: 70, delay: 220 }}
			/>

			<div class="w-[90%] p-5">
				<p class="mt-4 inline max-w-2xl text-lg" in:fade={{ duration: 400, delay: 100 }}>
					{selectedProject.description}
				</p>
			</div>

			<img
				src={`/images/${selectedProject.name.toLowerCase()}/bg.png`}
				alt={selectedProject.description}
				class="bg-project absolute -z-10 aspect-16/9 h-[40svh] object-cover"
				in:fly={{ duration: 350, x: 100, opacity: 0 }}
				out:fly={{ duration: 350, y: 100, opacity: 0, delay: 200 }}
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
			color: transparent;

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

	.project-preview {
		perspective: 1000px;
		perspective-origin: 50% 50%;

		img.bg-project {
			transform: rotateX(10deg) rotateY(-25deg) rotateZ(5deg) translateX(20%) translateY(-15%);
		}
	}
</style>
