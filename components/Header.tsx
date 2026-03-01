import Link from 'next/link';
import { nav } from '@/lib/site';

export default function Header() {
  return (
    <header className="sticky top-0 z-40 border-b border-rose/10 bg-white/90 backdrop-blur">
      <div className="mx-auto flex max-w-6xl items-center justify-between px-4 py-3 md:px-6">
        <Link href="/" className="text-lg font-semibold text-plum">Restored by Randi</Link>
        <nav className="hidden gap-6 text-sm md:flex">
          {nav.map((item) => (
            <Link key={item.href} href={item.href} className="text-gray-700 transition hover:text-rose">{item.label}</Link>
          ))}
        </nav>
        <Link href="tel:610-721-2794" className="rounded-full bg-plum px-4 py-2 text-sm font-medium text-white">Call 610-721-2794</Link>
      </div>
    </header>
  );
}
