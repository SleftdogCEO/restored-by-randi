import CTA from '@/components/CTA';
export default function InsuranceGuidePage() {
  return <section><h1 className="text-4xl font-bold md:text-5xl">Insurance guide</h1><p className="mt-4 max-w-3xl">Most plans, including Medicare, cover medically necessary breast prostheses and mastectomy bras. We help with documentation, claims, and appeals.</p><div className="mt-8 grid gap-4 md:grid-cols-3">{['Verify coverage', 'Collect prescription', 'Submit claim and track'].map((s) => <div key={s} className="rounded-xl border border-rose/10 p-4"><p className="font-semibold text-plum">{s}</p></div>)}</div><CTA title="Need claim support now?" body="Call 610-721-2794 and we can walk your benefits with you." /></section>;
}
