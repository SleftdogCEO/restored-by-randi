import Link from 'next/link';
import { getAllPosts } from '@/lib/blog';

export default async function BlogIndexPage() {
  const posts = await getAllPosts();
  return (
    <section>
      <h1 className="text-4xl font-bold md:text-5xl">Education and support articles</h1>
      <p className="mt-3 max-w-2xl">Practical guides on fitting, insurance, recovery, and product comparisons.</p>
      <div className="mt-10 space-y-4">
        {posts.map((post) => (
          <Link key={post.slug} href={`/blog/${post.slug}`} className="block rounded-2xl border border-rose/10 p-5 shadow-soft hover:border-rose/30">
            <h2 className="text-2xl font-semibold">{post.title}</h2>
            <p className="mt-2 text-sm">{post.excerpt}...</p>
          </Link>
        ))}
      </div>
    </section>
  );
}
