import fs from 'node:fs';
import path from 'node:path';
import matter from 'gray-matter';
import { remark } from 'remark';
import html from 'remark-html';

const postsDir = path.join(process.cwd(), 'content/blog-posts');

export type Post = {
  slug: string;
  title: string;
  excerpt: string;
  content: string;
};

function extractTitle(markdown: string, fallback: string) {
  const line = markdown.split('\n').find((l) => l.startsWith('# '));
  return line ? line.replace('# ', '').trim() : fallback;
}

export function getPostSlugs() {
  return fs
    .readdirSync(postsDir)
    .filter((f) => f.endsWith('.md'))
    .map((f) => f.replace(/^\d+-/, '').replace('.md', ''));
}

export async function getPostBySlug(slug: string): Promise<Post | null> {
  const file = fs
    .readdirSync(postsDir)
    .find((f) => f.endsWith(`${slug}.md`) || f.replace(/^\d+-/, '').replace('.md', '') === slug);

  if (!file) return null;

  const raw = fs.readFileSync(path.join(postsDir, file), 'utf8');
  const { content } = matter(raw);
  const title = extractTitle(content, slug.replace(/-/g, ' '));
  const processed = await remark().use(html).process(content);
  const body = processed.toString();

  return {
    slug,
    title,
    excerpt: content.split('\n').slice(1, 5).join(' ').slice(0, 170),
    content: body,
  };
}

export async function getAllPosts() {
  const slugs = getPostSlugs();
  const posts = await Promise.all(slugs.map((slug) => getPostBySlug(slug)));
  return posts.filter(Boolean) as Post[];
}
