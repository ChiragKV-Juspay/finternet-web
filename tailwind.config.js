/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,mjs}"],
  theme: {
    fontFamily: {
      "space-grotesk": ['"Space Grotesk"'],
    },
    extend: {
      colors: {
        "lightBlue-rgba": "rgba(0, 145, 255, 0.15)",
        primaryBlue: "#0091FF",
        textGray: "#797979",
        disabledGray: "#D5D5D5",
      },
    },
  },
  plugins: [],
};
