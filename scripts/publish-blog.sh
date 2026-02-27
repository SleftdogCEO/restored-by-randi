#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
python3 - <<'PY'
import re, html
from pathlib import Path
from datetime import date, timedelta

ROOT = Path('.')
POSTS = ROOT/'content'/'blog-posts'
BLOG = ROOT/'blog'
SITE = 'https://restoredbyrandi.com'
BLOG.mkdir(exist_ok=True)

def slug_from(path):
    return re.sub(r'^\d+-', '', path.stem)

def post_num(path):
    m = re.match(r'^(\d+)-', path.stem)
    return int(m.group(1)) if m else 999

def pub_date(n):
    d = date(2025,10,1) + timedelta(days=(n-1)*7)
    return d

def parse(md_text):
    lines = md_text.splitlines()
    title = ''
    author = 'Randi'
    subtitle = ''
    body = []
    for ln in lines:
        if ln.startswith('# ') and not title:
            title = ln[2:].strip(); continue
        if ln.startswith('**Author:**'):
            author = ln.split(':',1)[1].strip(); continue
        if ln.startswith('*') and ln.endswith('*') and not subtitle:
            subtitle = ln.strip('*'); continue
        body.append(ln)
    return title, author, subtitle, '\n'.join(body)

def inline_fmt(s):
    s = html.escape(s)
    s = re.sub(r'\[([^\]]+)\]\(([^)]+)\)', r'<a href="\2">\1</a>', s)
    s = re.sub(r'\*\*([^*]+)\*\*', r'<strong>\1</strong>', s)
    s = re.sub(r'\*([^*]+)\*', r'<em>\1</em>', s)
    return s

def md_to_html(md):
    out=[]; in_ul=False
    for raw in md.splitlines():
        ln = raw.strip()
        if not ln or ln=='---' or ln.startswith('**Published:**') or ln.startswith('**SEO Keywords:**'):
            if in_ul: out.append('</ul>'); in_ul=False
            continue
        if ln.startswith('### '):
            if in_ul: out.append('</ul>'); in_ul=False
            out.append(f"<h3>{inline_fmt(ln[4:])}</h3>"); continue
        if ln.startswith('## '):
            if in_ul: out.append('</ul>'); in_ul=False
            out.append(f"<h2>{inline_fmt(ln[3:])}</h2>"); continue
        if ln.startswith('# '):
            if in_ul: out.append('</ul>'); in_ul=False
            out.append(f"<h1>{inline_fmt(ln[2:])}</h1>"); continue
        if ln.startswith('- '):
            if not in_ul: out.append('<ul>'); in_ul=True
            out.append(f"<li>{inline_fmt(ln[2:])}</li>"); continue
        if in_ul: out.append('</ul>'); in_ul=False
        out.append(f"<p>{inline_fmt(ln)}</p>")
    if in_ul: out.append('</ul>')
    return '\n'.join(out)

def category_for(slug):
    s=slug.lower()
    if any(k in s for k in ['insurance','medicare','whcra','claim']): return 'insurance'
    if any(k in s for k in ['recovery','self-care','lymphedema','when-to-get-fitted','first-mastectomy']): return 'recovery'
    if any(k in s for k in ['swim','bra','silicone','amoena','prosthesis','fitting','caring']): return 'product'
    if any(k in s for k in ['west-palm','palm-beach','story']): return 'local'
    return 'guides'

post_files = sorted(POSTS.glob('*.md'), key=post_num)
meta=[]
for p in post_files:
    n=post_num(p)
    slug=slug_from(p)
    title,author,subtitle,body=parse(p.read_text())
    excerpt = re.sub(r'\s+',' ', re.sub(r'[#*_`>-]','', body)).strip()[:180]
    d=pub_date(n)
    cat=category_for(slug)
    meta.append({'path':p,'n':n,'slug':slug,'title':title,'author':author,'subtitle':subtitle,'body':body,'excerpt':excerpt,'date':d,'cat':cat})

for m in meta:
    related=[x for x in sorted(meta,key=lambda z:z['n'], reverse=True) if x['slug']!=m['slug']][:3]
    rel_html=''.join([f"<li><a href='/blog/{r['slug']}.html'>{html.escape(r['title'])}</a></li>" for r in related])
    content=md_to_html(m['body'])
    page=f'''<!DOCTYPE html><html lang="en"><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>{html.escape(m['title'])} | Restored by Randi Blog</title>
<meta name="description" content="{html.escape(m['excerpt'])}">
<link rel="canonical" href="{SITE}/blog/{m['slug']}.html">
<meta property="og:title" content="{html.escape(m['title'])}"><meta property="og:description" content="{html.escape(m['excerpt'])}">
<meta property="og:type" content="article"><meta property="og:url" content="{SITE}/blog/{m['slug']}.html"><meta property="og:image" content="{SITE}/logo.jpg">
<script type="application/ld+json">{{"@context":"https://schema.org","@type":"Article","headline":{html.escape(repr(m['title']))},"datePublished":"{m['date'].isoformat()}","dateModified":"{m['date'].isoformat()}","author":{{"@type":"Person","name":"Randi"}},"publisher":{{"@type":"Organization","name":"Restored by Randi"}},"mainEntityOfPage":"{SITE}/blog/{m['slug']}.html"}}</script>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;600;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
<style>body{{font-family:Montserrat,sans-serif;margin:0;color:#2D2D2D}}h1,h2,h3{{font-family:'Cormorant Garamond',serif}}nav{{position:fixed;top:0;width:100%;background:#fff;padding:.8rem 2rem;border-bottom:1px solid #f3c2d1;z-index:3}}nav a{{margin-right:1rem;color:#555;text-decoration:none;text-transform:uppercase;font-size:.75rem}}.wrap{{max-width:1100px;margin:0 auto;padding:6.5rem 1rem 3rem;display:grid;grid-template-columns:2fr 1fr;gap:2rem}}@media(max-width:900px){{.wrap{{grid-template-columns:1fr}}}}article p{{line-height:1.75;color:#555}}article ul{{line-height:1.75;color:#555}}.date{{color:#E8497F;font-size:.9rem}}.share a{{display:inline-block;margin:.25rem;padding:.5rem .9rem;border-radius:999px;color:#fff;text-decoration:none;font-size:.78rem}}.cta{{background:#FFF5F5;border-left:4px solid #E8497F;padding:1.2rem;border-radius:0 12px 12px 0;margin-top:1.2rem}}.side{{background:#fff7fa;border:1px solid #f7c5cc;border-radius:12px;padding:1rem;height:fit-content}}footer{{background:#2D2D2D;color:#ccc;text-align:center;padding:1.4rem;margin-top:2rem}}</style>
</head><body>
<nav><a href="/">Home</a><a href="/#shop">Shop</a><a href="/blog/">Blog</a><a href="/#virtual-fitting">Virtual Fitting</a><a href="/#contact">Contact</a></nav>
<div class="wrap"><article>
<a href="/blog/">&larr; Back to Blog</a><h1>{html.escape(m['title'])}</h1><p class="date">{m['date'].strftime('%B %d, %Y')} | By {html.escape(m['author'])}</p>{('<p><em>'+html.escape(m['subtitle'])+'</em></p>') if m['subtitle'] else ''}
{content}
<div class="share"><a style="background:#1877F2" href="https://www.facebook.com/sharer/sharer.php?u={SITE}/blog/{m['slug']}.html">Facebook</a><a style="background:#1DA1F2" href="https://twitter.com/intent/tweet?url={SITE}/blog/{m['slug']}.html">Twitter</a><a style="background:#E60023" href="https://pinterest.com/pin/create/button/?url={SITE}/blog/{m['slug']}.html">Pinterest</a><a style="background:#555" href="mailto:?subject={html.escape(m['title'])}&body={SITE}/blog/{m['slug']}.html">Email</a></div>
<div class="cta"><h3>Get personalized support</h3><p>Need help choosing the right products? Book a virtual consultation or explore our shop.</p><p><a href="/#virtual-fitting">Book Consultation</a> | <a href="/#shop">Shop Now</a></p></div>
</article>
<aside class="side"><h3>Related Posts</h3><ul>{rel_html}</ul><h3>Email Updates</h3><form><input type="email" placeholder="Your email" style="width:100%;padding:.6rem;border:1px solid #f7c5cc;border-radius:8px"><button type="submit" style="margin-top:.5rem;background:#E8497F;color:#fff;border:none;padding:.6rem 1rem;border-radius:999px">Subscribe</button></form></aside>
</div><footer>© 2026 Restored by Randi</footer></body></html>'''
    (BLOG/f"{m['slug']}.html").write_text(page)

cards=[]
for m in sorted(meta,key=lambda x:x['n'], reverse=True):
    cards.append(f"<article class='card' data-cat='{m['cat']}'><span class='date'>{m['date'].strftime('%B %d, %Y')}</span><h2><a href='/blog/{m['slug']}.html'>{html.escape(m['title'])}</a></h2><p>{html.escape(m['excerpt'])}</p><p><small>Category: {m['cat'].title()}</small></p><a href='/blog/{m['slug']}.html'>Read More →</a></article>")

index=f'''<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1.0"><title>Blog | Restored by Randi</title>
<meta name="description" content="Mastectomy product, recovery, insurance, and care guides."><link rel="canonical" href="{SITE}/blog/">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;600;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
<style>body{{font-family:Montserrat,sans-serif;margin:0;color:#2D2D2D}}h1,h2{{font-family:'Cormorant Garamond',serif}}nav{{position:fixed;top:0;width:100%;background:#fff;padding:.8rem 2rem;border-bottom:1px solid #f3c2d1}}nav a{{margin-right:1rem;color:#555;text-decoration:none;text-transform:uppercase;font-size:.75rem}}header{{padding:7rem 1rem 2rem;text-align:center;background:linear-gradient(135deg,#FFF5F5,#F8BBD0)}}.filters{{display:flex;gap:.5rem;justify-content:center;flex-wrap:wrap;margin:1rem 0}}.filters button{{border:1px solid #E8497F;background:#fff;color:#E8497F;padding:.4rem .9rem;border-radius:999px;cursor:pointer}}.grid{{max-width:900px;margin:0 auto;padding:1rem}}.card{{background:#fff;border:1px solid #f7c5cc;border-radius:12px;padding:1.2rem;margin:0 0 1rem}}.date{{color:#E8497F;font-size:.82rem}}.signup{{background:#FFF5F5;padding:1.2rem;border-radius:12px;text-align:center;margin:1.5rem 0}}footer{{background:#2D2D2D;color:#ccc;text-align:center;padding:1.4rem;margin-top:2rem}}</style></head><body>
<nav><a href="/">Home</a><a href="/#shop">Shop</a><a href="/blog/">Blog</a><a href="/#contact">Contact</a></nav>
<header><h1>The <span style="color:#E8497F">Restored</span> Blog</h1><p>Compassionate, practical guides for life after breast cancer.</p></header>
<div class="filters"><button onclick="f('all')">All</button><button onclick="f('product')">Products</button><button onclick="f('insurance')">Insurance</button><button onclick="f('recovery')">Recovery</button><button onclick="f('local')">Local</button><button onclick="f('guides')">Guides</button></div>
<main class="grid">{''.join(cards)}
<div class="signup"><h3>Email Signup</h3><p>Get new posts and special offers.</p><form><input type="email" placeholder="Your email" style="padding:.6rem;border:1px solid #f7c5cc;border-radius:8px"><button style="margin-left:.5rem;background:#E8497F;color:#fff;border:none;padding:.6rem 1rem;border-radius:999px">Subscribe</button></form></div>
</main><footer>© 2026 Restored by Randi</footer>
<script>function f(cat){{document.querySelectorAll('.card').forEach(c=>c.style.display=(cat==='all'||c.dataset.cat===cat)?'block':'none')}}</script></body></html>'''
(BLOG/'index.html').write_text(index)
print(f"Built {len(meta)} posts + blog index")
PY
