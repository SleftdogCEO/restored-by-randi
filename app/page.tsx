import Link from 'next/link';
import CTA from '@/components/CTA';

export default function HomePage() {
  return (
    <>
      <section className="rounded-3xl bg-hero px-6 py-16 shadow-soft md:px-12">
        <p className="text-sm font-semibold uppercase tracking-wide text-rose">Premium post-mastectomy support</p>
        <h1 className="mt-4 max-w-3xl text-4xl font-bold md:text-6xl">Feel balanced, supported, and fully yourself again.</h1>
        <p className="mt-5 max-w-2xl text-lg">Restored by Randi offers private fittings, curated products, and insurance guidance with a modern, compassionate experience.</p>
        <div className="mt-8 flex flex-wrap gap-3">
          <Link href="/shop" className="rounded-full bg-plum px-6 py-3 font-semibold text-white">Shop categories</Link>
          <Link href="/virtual-fitting" className="rounded-full border border-plum/20 bg-white px-6 py-3 font-semibold text-plum">Start virtual fitting</Link>
        </div>
      </section>

      <section className="mt-14 grid gap-5 md:grid-cols-3">
        {[
          ['Bras', 'Pocketed daily, post-op, and comfort-first styles.', '/shop/bras'],
          ['Prosthesis', 'Silicone, lightweight, partial, and swim forms.', '/shop/prosthesis'],
          ['Compression', 'Post-surgery recovery and lymphedema support.', '/shop/compression'],
        ].map(([title, text, href]) => (
          <Link key={title} href={href} className="rounded-2xl border border-rose/10 bg-white p-6 shadow-soft transition hover:-translate-y-1">
            <h2 className="text-2xl font-semibold">{title}</h2>
            <p className="mt-2">{text}</p>
          </Link>
        ))}
      </section>

      <CTA title="Personal care, wherever you are" body="Meet one-on-one virtually for fit guidance, product recommendations, and help using insurance benefits confidently." />

      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify({
            '@context': 'https://schema.org',
            '@type': 'MedicalBusiness',
            name: 'Restored by Randi',
            areaServed: 'West Palm Beach, FL',
            telephone: '610-721-2794',
            url: 'https://restoredbyrandi.com',
          }),
        }}
      />
    </>
  );
}
