import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './lib/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        blush: '#fdf4f7',
        rose: '#8a4761',
        plum: '#4a1f35',
        sage: '#d9e8df',
        ink: '#1d1020',
      },
      boxShadow: {
        soft: '0 20px 50px rgba(74,31,53,0.08)',
      },
      backgroundImage: {
        hero: 'radial-gradient(circle at top right, #fdeef4 0%, #fff 45%, #f7faf8 100%)',
      },
    },
  },
  plugins: [],
};

export default config;
