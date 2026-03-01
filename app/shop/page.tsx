import CTA from '@/components/CTA';
import Link from 'next/link';

const categories = [
  { title: 'Mastectomy Bras', href: '/shop/bras', desc: 'Elegant support, pocketed security, and day-to-night comfort.' },
  { title: 'Breast Prosthesis', href: '/shop/prosthesis', desc: 'Premium silicone and lightweight forms matched to your body and lifestyle.' },
  { title: 'Compression Garments', href: '/shop/compression', desc: 'Recovery-focused compression pieces designed for healing and confidence.' },
];

export default function ShopPage() {
  return (
    <>
      <h1 className="text-4xl font-bold md:text-5xl">Shop by category</h1>
      <p className="mt-4 max-w-2xl">Curated essentials from trusted mastectomy and recovery brands, selected for comfort, fit, and quality.</p>
      <div className="mt-10 grid gap-5 md:grid-cols-3">
        {categories.map((category) => (
          <Link key={category.href} href={category.href} className="rounded-2xl border border-rose/10 p-6 shadow-soft">
            <h2 className="text-2xl font-semibold">{category.title}</h2>
            <p className="mt-2">{category.desc}</p>
          </Link>
        ))}
      </div>
      <CTA title="Need help picking products?" body="Book a private fitting session and get recommendations built around your surgery, comfort goals, and wardrobe." />
    </>
  );
}
