# Restored by Randi - Next.js + Tailwind Redesign

Modernized website rebuilt on a reusable component architecture with static export compatibility for GitHub Pages.

## Stack

- Next.js 14 (App Router)
- Tailwind CSS
- Markdown blog content model (`content/blog-posts/*.md`)
- Static export (`output: 'export'`) for GitHub Pages

## Included pages

- Home (`/`)
- Shop categories (`/shop`, `/shop/bras`, `/shop/prosthesis`, `/shop/compression`)
- Virtual fitting (`/virtual-fitting`)
- Insurance guide (`/insurance-guide`)
- West Palm Beach page (`/west-palm-beach`)
- Blog index + post template (`/blog`, `/blog/[slug]`)

## SEO + URL preservation

- App-level metadata and OG defaults in `app/layout.tsx`
- Article metadata for blog posts
- Basic schema (`MedicalBusiness` on home, `Article` on blog posts)
- `app/sitemap.ts` and `app/robots.ts`
- Legacy URL support:
  - Equivalent routes under `/pages/*`
  - Generated legacy `.html` redirect files in `public/blog/*.html` and `public/pages/*.html`

## Contact updates

Primary contact phone has been standardized in the new app to:

**610-721-2794**

## Development

```bash
npm install
npm run legacy:redirects
npm run dev
```

Open http://localhost:3000

## Build / export

```bash
npm run legacy:redirects
npm run build
```

Next.js static output is generated in `out/` and is compatible with GitHub Pages.

## Deploy notes (GitHub Pages)

- Commit `public/CNAME` and `public/.nojekyll`
- Publish the built `out/` directory through your Pages workflow
- If using custom domain, confirm DNS still points to GitHub Pages
