import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const blogDir = path.join(root, 'blog');
const outBlog = path.join(root, 'public/blog');
const outPages = path.join(root, 'public/pages');

fs.mkdirSync(outBlog, { recursive: true });
fs.mkdirSync(outPages, { recursive: true });

const html = (target) => `<!doctype html><html><head><meta charset="utf-8"><meta http-equiv="refresh" content="0; url=${target}"><link rel="canonical" href="${target}"></head><body>Redirecting to <a href="${target}">${target}</a></body></html>`;

for (const file of fs.readdirSync(blogDir).filter((f) => f.endsWith('.html') && f !== 'index.html')) {
  const slug = file.replace('.html', '');
  fs.writeFileSync(path.join(outBlog, file), html(`/blog/${slug}/`));
}

const pageMap = {
  'mastectomy-bras.html': '/shop/bras/',
  'breast-prosthesis.html': '/shop/prosthesis/',
  'compression-garments.html': '/shop/compression/',
  'virtual-fitting-quiz.html': '/virtual-fitting/',
  'insurance-reimbursement-guide.html': '/insurance-guide/',
  'west-palm-beach-mastectomy-fitter.html': '/west-palm-beach/',
  'amoena-vs-abc.html': '/blog/amoena-vs-abc/',
  'silicone-vs-lightweight-forms.html': '/blog/silicone-vs-lightweight/',
  'compression-bra-vs-sports-bra.html': '/blog/compression-bra-vs-regular-bra-after-surgery/',
};

for (const [file, target] of Object.entries(pageMap)) {
  fs.writeFileSync(path.join(outPages, file), html(target));
}

console.log('Legacy redirect pages generated.');
