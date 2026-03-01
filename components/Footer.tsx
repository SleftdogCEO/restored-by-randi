import Link from 'next/link';
import { site } from '@/lib/site';

export default function Footer() {
  return (
    <footer className="mt-20 border-t border-rose/10 bg-blush">
      <div className="mx-auto grid max-w-6xl gap-8 px-4 py-12 md:grid-cols-3 md:px-6">
        <div>
          <p className="text-lg font-semibold text-plum">{site.name}</p>
          <p className="mt-2 text-sm">Compassionate fitting, modern products, and full insurance support.</p>
        </div>
        <div>
          <p className="font-semibold text-plum">Visit</p>
          <p className="mt-2 text-sm">{site.address}</p>
          <p className="text-sm">Phone: {site.phone}</p>
        </div>
        <div>
          <p className="font-semibold text-plum">Quick links</p>
          <ul className="mt-2 space-y-2 text-sm">
            <li><Link href="/shop" className="hover:text-rose">Shop categories</Link></li>
            <li><Link href="/insurance-guide" className="hover:text-rose">Insurance guide</Link></li>
            <li><Link href="/virtual-fitting" className="hover:text-rose">Virtual fitting</Link></li>
          </ul>
        </div>
      </div>
    </footer>
  );
}
