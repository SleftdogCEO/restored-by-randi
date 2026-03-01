import type { MetadataRoute } from 'next';
import { getPostSlugs } from '@/lib/blog';
import { site } from '@/lib/site';

export default function sitemap(): MetadataRoute.Sitemap {
  const base = site.url;
  const staticRoutes = ['','/shop','/shop/bras','/shop/prosthesis','/shop/compression','/virtual-fitting','/insurance-guide','/west-palm-beach','/blog'];
  const posts = getPostSlugs().map((slug) => ({ url: `${base}/blog/${slug}`, lastModified: new Date() }));
  return [
    ...staticRoutes.map((route) => ({ url: `${base}${route}`, lastModified: new Date() })),
    ...posts,
  ];
}
