<script lang="ts">
	import '../stylesheets/root.css';
	import '../stylesheets/global.css';

	let { children } = $props();
</script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=MuseoModerno:ital,wght@0,100..900;1,100..900&display=swap');
</style>

{@render children()}
