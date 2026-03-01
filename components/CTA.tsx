import Link from 'next/link';

export default function CTA({ title, body }: { title: string; body: string }) {
  return (
    <section className="mt-14 rounded-3xl bg-plum p-8 text-white md:p-12">
      <h2 className="text-2xl font-semibold text-white md:text-3xl">{title}</h2>
      <p className="mt-3 max-w-2xl text-rose-100">{body}</p>
      <div className="mt-6 flex flex-wrap gap-3">
        <Link href="/virtual-fitting" className="rounded-full bg-white px-5 py-3 text-sm font-semibold text-plum">Book a virtual fitting</Link>
        <Link href="tel:610-721-2794" className="rounded-full border border-white/40 px-5 py-3 text-sm font-semibold text-white">Call 610-721-2794</Link>
      </div>
    </section>
  );
}
