/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./layouts/**/*.{html,js}", "./content/**/*.{html,md}", "./hugo.yaml"],
  safelist: [
    "bg-[#171a21]",
    "bg-[#1877F2]",
    "bg-[#1DA1F2]",
    "bg-[#E4405F]",
    "bg-[#FF0000]",
    "bg-[#9146FF]",
    "bg-[#F52828]",
    "bg-[#ff0050]",
    "hover:text-[#171a21]",
    "hover:text-[#1877F2]",
    "hover:text-[#1DA1F2]",
    "hover:text-[#E4405F]",
    "hover:text-[#FF0000]",
    "hover:text-[#9146FF]",
    "hover:text-[#F52828]",
    "hover:text-[#ff0050]"
  ],
  theme: {
    extend: {
      colors: {
        "pcg-red": "#e00e12",
        "pcg-black": "#000000",
        "pcg-dark-blue": "#0c1a30",
      },
      fontFamily: {
        sans: ["Inter", "Roboto", "sans-serif"],
        display: ["Oswald", "sans-serif"],
      },
    },
  },
  plugins: [],
};
