<script lang="ts">
	import Navbar from '$lib/components/Navbar.svelte';
	import Hero from "$lib/components/Hero.svelte";
	import Projects from '$lib/components/Projects.svelte';
</script>

<Navbar />
<Hero />
<Projects />
<slot />
