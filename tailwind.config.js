/** @type {import('tailwindcss').Config} */
export default {
    content: ["./src/**/*.{svelte,js,ts}"],
    theme: {
      extend: {
        colors: {
          custom: {
            black: "#000000",
            white: "#FFFFFF",
            green: "#00FF00",
            blue: "#0000FF",
          }
        },
      },
    },
    plugins: [],
  };
  