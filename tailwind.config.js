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
        "lightGrayBorder-rgba": "rgba(0, 0, 0, 0.23)",
        primaryBlue: "#0091FF",
        textGray: "#797979",
        disabledGray: "#D5D5D5",
        red: "#FE3E07",
        green: "#0EAD00",
      },
    },
  },
  plugins: [],
};
