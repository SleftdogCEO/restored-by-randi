#!/bin/bash
# publish-blog.sh - Convert markdown blog posts to HTML and build blog index
# Usage: ./scripts/publish-blog.sh [specific-file.md]  (no arg = all posts)

set -e
cd "$(dirname "$0")/.."

BLOG_DIR="blog"
POSTS_DIR="content/blog-posts"
SITE_URL="https://restoredbyrandi.com"

mkdir -p "$BLOG_DIR"

# Simple markdown to HTML converter (no external deps)
md_to_html() {
    local input="$1"
    sed \
        -e 's/^### \(.*\)/<h3>\1<\/h3>/' \
        -e 's/^## \(.*\)/<h2>\1<\/h2>/' \
        -e 's/^# \(.*\)/<h1>\1<\/h1>/' \
        -e 's/^\*\*Published:\*\* \(.*\)/<p class="post-date">\1<\/p>/' \
        -e 's/^\*\*Author:\*\* \(.*\)/<p class="post-author">By \1<\/p>/' \
        -e 's/^\*\*SEO Keywords:\*\* .*//' \
        -e 's/^---$//' \
        -e 's/^\*\(.*\)\*$/<p class="post-subtitle"><em>\1<\/em><\/p>/' \
        -e 's/^- \(.*\)/<li>\1<\/li>/' \
        -e '/^$/s/^$/<BLANK>/' \
        "$input" | \
    awk '
    BEGIN { in_ul=0; in_p=0 }
    /<li>/ {
        if (!in_ul) { print "<ul>"; in_ul=1 }
        print; next
    }
    {
        if (in_ul) { print "</ul>"; in_ul=0 }
    }
    /^<h[123]>/ || /^<p class=/ || /^<ul>/ || /^<\/ul>/ || /^<BLANK>$/ { print; next }
    /^\[.*\]/ {
        # Convert markdown links to HTML
        line=$0
        gsub(/\[([^]]*)\]\(([^)]*)\)/, "<a href=\"\\2\">\\1</a>", line)
        print "<p>" line "</p>"
        next
    }
    /^.+$/ {
        # Inline bold/italic
        line=$0
        gsub(/\*\*([^*]+)\*\*/, "<strong>\\1</strong>", line)
        gsub(/\*([^*]+)\*/, "<em>\\1</em>", line)
        print "<p>" line "</p>"
        next
    }
    { print }
    END { if (in_ul) print "</ul>" }
    ' | \
    sed '/<BLANK>/d' | \
    sed '/<p><\/p>/d'
}

# Extract title from markdown (first # line)
get_title() {
    grep -m1 '^# ' "$1" | sed 's/^# //'
}

# Extract first real paragraph as excerpt
get_excerpt() {
    sed -n '/^[A-Z]/p; /^[a-z]/p' "$1" | grep -v '^\*\*' | head -1 | cut -c1-200
}

# Get slug from filename
get_slug() {
    basename "$1" .md | sed 's/^[0-9]*-//'
}

# Assign dates starting from 2025-10-01, one per week
get_date() {
    local num=$(basename "$1" .md | grep -o '^[0-9]*')
    num=$((10#$num - 1))
    if [[ "$(uname)" == "Darwin" ]]; then
        date -v+${num}w -j -f "%Y-%m-%d" "2025-10-01" "+%B %d, %Y"
    else
        date -d "2025-10-01 + $((num)) weeks" "+%B %d, %Y"
    fi
}

get_date_iso() {
    local num=$(basename "$1" .md | grep -o '^[0-9]*')
    num=$((10#$num - 1))
    if [[ "$(uname)" == "Darwin" ]]; then
        date -v+${num}w -j -f "%Y-%m-%d" "2025-10-01" "+%Y-%m-%d"
    else
        date -d "2025-10-01 + $((num)) weeks" "+%Y-%m-%d"
    fi
}

# Generate a single blog post HTML
generate_post() {
    local md_file="$1"
    local title=$(get_title "$md_file")
    local slug=$(get_slug "$md_file")
    local pub_date=$(get_date "$md_file")
    local pub_date_iso=$(get_date_iso "$md_file")
    local excerpt=$(get_excerpt "$md_file")
    local content=$(md_to_html "$md_file")
    local out_file="$BLOG_DIR/${slug}.html"

    cat > "$out_file" <<HTMLEOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} | Restored by Randi Blog</title>
    <meta name="description" content="${excerpt}">
    <link rel="canonical" href="${SITE_URL}/blog/${slug}.html">
    <meta property="og:title" content="${title}">
    <meta property="og:description" content="${excerpt}">
    <meta property="og:type" content="article">
    <meta property="og:url" content="${SITE_URL}/blog/${slug}.html">
    <meta property="og:image" content="${SITE_URL}/logo.jpg">
    <meta property="og:site_name" content="Restored by Randi">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="${title}">
    <meta name="twitter:description" content="${excerpt}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Article",
      "headline": "${title}",
      "description": "${excerpt}",
      "author": {"@type": "Person", "name": "Randi"},
      "publisher": {"@type": "Organization", "name": "Restored by Randi", "logo": {"@type": "ImageObject", "url": "${SITE_URL}/logo.jpg"}},
      "datePublished": "${pub_date_iso}",
      "dateModified": "${pub_date_iso}",
      "mainEntityOfPage": "${SITE_URL}/blog/${slug}.html",
      "image": "${SITE_URL}/logo.jpg"
    }
    </script>
    <style>
        :root {
            --primary: #E8497F;
            --primary-dark: #D13A6B;
            --secondary: #F7C5CC;
            --bg-warm: #FFF5F5;
            --bg-white: #FFFFFF;
            --text-dark: #2D2D2D;
            --text-medium: #555555;
            --text-light: #888888;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Montserrat', sans-serif; color: var(--text-dark); background: var(--bg-white); line-height: 1.8; }
        h1, h2, h3 { font-family: 'Cormorant Garamond', serif; font-weight: 600; }
        nav {
            position: fixed; top: 0; width: 100%; z-index: 1000;
            background: rgba(255,255,255,0.97); backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(232,73,127,0.1);
            padding: 0.8rem 2rem; display: flex; justify-content: space-between; align-items: center;
        }
        nav .nav-logo { height: 42px; }
        nav .nav-links { display: flex; gap: 1.5rem; list-style: none; align-items: center; }
        nav .nav-links a { color: var(--text-medium); text-decoration: none; font-size: 0.78rem; text-transform: uppercase; letter-spacing: 0.12em; font-weight: 500; transition: color 0.3s; }
        nav .nav-links a:hover { color: var(--primary); }
        .nav-toggle { display: none; background: none; border: none; color: var(--primary); font-size: 1.5rem; cursor: pointer; }
        @media (max-width: 768px) {
            .nav-toggle { display: block; }
            nav .nav-links { display: none; flex-direction: column; position: absolute; top: 100%; left: 0; right: 0; background: white; padding: 1rem 2rem; gap: 1rem; border-bottom: 1px solid var(--secondary); }
            nav .nav-links.open { display: flex; }
        }
        .blog-post { max-width: 760px; margin: 0 auto; padding: 7rem 2rem 4rem; }
        .blog-post h1 { font-size: 2.5rem; margin-bottom: 0.5rem; color: var(--text-dark); line-height: 1.2; }
        .blog-post .post-date { color: var(--primary); font-size: 0.9rem; margin-bottom: 0.25rem; }
        .blog-post .post-author { color: var(--text-light); font-size: 0.85rem; margin-bottom: 2rem; }
        .blog-post .post-subtitle { color: var(--text-medium); font-size: 1.1rem; margin-bottom: 1.5rem; font-style: italic; }
        .blog-post h2 { font-size: 1.8rem; margin: 2.5rem 0 1rem; color: var(--text-dark); }
        .blog-post h3 { font-size: 1.4rem; margin: 2rem 0 0.75rem; color: var(--text-dark); }
        .blog-post p { margin-bottom: 1.2rem; color: var(--text-medium); }
        .blog-post ul { margin: 0.5rem 0 1.5rem 1.5rem; color: var(--text-medium); }
        .blog-post li { margin-bottom: 0.5rem; }
        .blog-post strong { color: var(--text-dark); }
        .blog-post a { color: var(--primary); text-decoration: none; }
        .blog-post a:hover { text-decoration: underline; }
        .share-buttons { display: flex; gap: 1rem; margin: 3rem 0; padding: 1.5rem 0; border-top: 1px solid var(--secondary); border-bottom: 1px solid var(--secondary); }
        .share-buttons a { display: inline-block; padding: 0.6rem 1.2rem; border-radius: 50px; font-size: 0.8rem; font-weight: 600; text-decoration: none; text-transform: uppercase; letter-spacing: 0.05em; }
        .share-fb { background: #1877F2; color: white; }
        .share-tw { background: #1DA1F2; color: white; }
        .share-email { background: var(--text-medium); color: white; }
        .share-pin { background: #E60023; color: white; }
        .cta-box { background: var(--bg-warm); border-left: 4px solid var(--primary); padding: 2rem; border-radius: 0 12px 12px 0; margin: 3rem 0; }
        .cta-box h3 { margin-bottom: 0.75rem; color: var(--primary); }
        .cta-box p { margin-bottom: 1rem; }
        .cta-button { display: inline-block; background: var(--primary); color: white; padding: 0.8rem 2rem; text-decoration: none; font-weight: 600; letter-spacing: 0.08em; text-transform: uppercase; font-size: 0.8rem; border-radius: 50px; transition: all 0.3s; }
        .cta-button:hover { background: var(--primary-dark); transform: translateY(-2px); }
        .back-link { display: inline-block; margin-bottom: 1.5rem; color: var(--primary); text-decoration: none; font-size: 0.85rem; font-weight: 500; }
        .back-link:hover { text-decoration: underline; }
        footer { background: #2D2D2D; color: #ccc; text-align: center; padding: 2rem; font-size: 0.85rem; }
        footer a { color: var(--secondary); }
    </style>
</head>
<body>
    <nav>
        <a href="/"><img src="/logo.jpg" alt="Restored by Randi" class="nav-logo"></a>
        <button class="nav-toggle" onclick="document.querySelector('.nav-links').classList.toggle('open')" aria-label="Menu">☰</button>
        <ul class="nav-links">
            <li><a href="/">Home</a></li>
            <li><a href="/#shop">Shop</a></li>
            <li><a href="/blog/">Blog</a></li>
            <li><a href="/#virtual-fitting">Virtual Fitting</a></li>
            <li><a href="/#contact">Contact</a></li>
        </ul>
    </nav>

    <article class="blog-post">
        <a href="/blog/" class="back-link">&larr; Back to Blog</a>
        ${content}

        <div class="share-buttons">
            <a href="https://www.facebook.com/sharer/sharer.php?u=${SITE_URL}/blog/${slug}.html" target="_blank" rel="noopener" class="share-fb">Facebook</a>
            <a href="https://twitter.com/intent/tweet?url=${SITE_URL}/blog/${slug}.html&text=${title}" target="_blank" rel="noopener" class="share-tw">Twitter</a>
            <a href="https://pinterest.com/pin/create/button/?url=${SITE_URL}/blog/${slug}.html&description=${title}" target="_blank" rel="noopener" class="share-pin">Pinterest</a>
            <a href="mailto:?subject=${title}&body=I thought you might find this helpful: ${SITE_URL}/blog/${slug}.html" class="share-email">Email</a>
        </div>

        <div class="cta-box">
            <h3>Ready to Find Your Perfect Fit?</h3>
            <p>Whether you're shopping online or visiting us in West Palm Beach, Randi is here to help you feel confident and comfortable.</p>
            <a href="/#virtual-fitting" class="cta-button">Book a Virtual Consultation</a>
            <a href="/#shop" class="cta-button" style="background:white;color:var(--primary);border:2px solid var(--primary);margin-left:0.5rem;">Shop Now</a>
        </div>
    </article>

    <footer>
        <p>&copy; $(date +%Y) Restored by Randi. All rights reserved. | <a href="/">Home</a> | <a href="/blog/">Blog</a></p>
    </footer>
</body>
</html>
HTMLEOF
    echo "  Generated: $out_file"
}

# Build blog index page
generate_index() {
    echo "Building blog index..."
    
    # Collect all posts metadata
    local posts_html=""
    local latest_three=""
    local count=0
    
    # Sort by filename (number prefix) in reverse for newest first
    for md_file in $(ls -r $POSTS_DIR/*.md); do
        local title=$(get_title "$md_file")
        local slug=$(get_slug "$md_file")
        local pub_date=$(get_date "$md_file")
        local excerpt=$(get_excerpt "$md_file")
        
        posts_html="${posts_html}
        <article class='blog-card'>
            <div class='blog-card-content'>
                <span class='blog-card-date'>${pub_date}</span>
                <h2><a href='/blog/${slug}.html'>${title}</a></h2>
                <p>${excerpt}</p>
                <a href='/blog/${slug}.html' class='read-more'>Read More &rarr;</a>
            </div>
        </article>"
        
        count=$((count + 1))
    done

    cat > "$BLOG_DIR/index.html" <<'IDXEOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog | Restored by Randi - Mastectomy Tips, Guides & Resources</title>
    <meta name="description" content="Expert guides on mastectomy fittings, breast prostheses, insurance coverage, recovery tips, and more from certified fitter Randi.">
    <link rel="canonical" href="https://restoredbyrandi.com/blog/">
    <meta property="og:title" content="Blog | Restored by Randi">
    <meta property="og:description" content="Expert guides on mastectomy fittings, breast prostheses, insurance coverage, and recovery tips.">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://restoredbyrandi.com/blog/">
    <meta property="og:image" content="https://restoredbyrandi.com/logo.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #E8497F;
            --primary-dark: #D13A6B;
            --secondary: #F7C5CC;
            --bg-warm: #FFF5F5;
            --bg-white: #FFFFFF;
            --text-dark: #2D2D2D;
            --text-medium: #555555;
            --text-light: #888888;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Montserrat', sans-serif; color: var(--text-dark); background: var(--bg-white); line-height: 1.7; }
        h1, h2, h3 { font-family: 'Cormorant Garamond', serif; font-weight: 600; }
        nav {
            position: fixed; top: 0; width: 100%; z-index: 1000;
            background: rgba(255,255,255,0.97); backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(232,73,127,0.1);
            padding: 0.8rem 2rem; display: flex; justify-content: space-between; align-items: center;
        }
        nav .nav-logo { height: 42px; }
        nav .nav-links { display: flex; gap: 1.5rem; list-style: none; align-items: center; }
        nav .nav-links a { color: var(--text-medium); text-decoration: none; font-size: 0.78rem; text-transform: uppercase; letter-spacing: 0.12em; font-weight: 500; transition: color 0.3s; }
        nav .nav-links a:hover, nav .nav-links a.active { color: var(--primary); }
        .nav-toggle { display: none; background: none; border: none; color: var(--primary); font-size: 1.5rem; cursor: pointer; }
        @media (max-width: 768px) {
            .nav-toggle { display: block; }
            nav .nav-links { display: none; flex-direction: column; position: absolute; top: 100%; left: 0; right: 0; background: white; padding: 1rem 2rem; gap: 1rem; border-bottom: 1px solid var(--secondary); }
            nav .nav-links.open { display: flex; }
        }
        .blog-header { background: linear-gradient(135deg, #FFF5F5, #FCE4EC, #F8BBD0); padding: 8rem 2rem 4rem; text-align: center; }
        .blog-header h1 { font-size: 3rem; margin-bottom: 0.75rem; }
        .blog-header h1 span { color: var(--primary); }
        .blog-header p { color: var(--text-medium); font-size: 1.1rem; max-width: 600px; margin: 0 auto; }
        .blog-grid { max-width: 900px; margin: 0 auto; padding: 3rem 2rem; }
        .blog-card { background: white; border-radius: 12px; box-shadow: 0 4px 20px rgba(232,73,127,0.08); margin-bottom: 2rem; overflow: hidden; transition: transform 0.3s, box-shadow 0.3s; }
        .blog-card:hover { transform: translateY(-4px); box-shadow: 0 12px 40px rgba(232,73,127,0.15); }
        .blog-card-content { padding: 2rem; }
        .blog-card-date { color: var(--primary); font-size: 0.8rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.1em; }
        .blog-card h2 { font-size: 1.6rem; margin: 0.5rem 0; }
        .blog-card h2 a { color: var(--text-dark); text-decoration: none; }
        .blog-card h2 a:hover { color: var(--primary); }
        .blog-card p { color: var(--text-medium); margin: 0.75rem 0; }
        .read-more { color: var(--primary); text-decoration: none; font-weight: 600; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.05em; }
        .read-more:hover { text-decoration: underline; }
        .signup-box { background: var(--bg-warm); padding: 3rem 2rem; text-align: center; margin: 2rem 0; border-radius: 12px; }
        .signup-box h3 { font-size: 1.8rem; margin-bottom: 0.75rem; }
        .signup-box p { color: var(--text-medium); margin-bottom: 1.5rem; }
        .signup-form { display: flex; gap: 0.75rem; max-width: 500px; margin: 0 auto; flex-wrap: wrap; justify-content: center; }
        .signup-form input { flex: 1; min-width: 200px; padding: 0.8rem 1.2rem; border: 2px solid var(--secondary); border-radius: 50px; font-family: inherit; font-size: 0.9rem; outline: none; }
        .signup-form input:focus { border-color: var(--primary); }
        .signup-form button { background: var(--primary); color: white; border: none; padding: 0.8rem 2rem; border-radius: 50px; font-family: inherit; font-weight: 600; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.08em; cursor: pointer; transition: background 0.3s; }
        .signup-form button:hover { background: var(--primary-dark); }
        footer { background: #2D2D2D; color: #ccc; text-align: center; padding: 2rem; font-size: 0.85rem; }
        footer a { color: var(--secondary); }
    </style>
</head>
<body>
    <nav>
        <a href="/"><img src="/logo.jpg" alt="Restored by Randi" class="nav-logo"></a>
        <button class="nav-toggle" onclick="document.querySelector('.nav-links').classList.toggle('open')" aria-label="Menu">☰</button>
        <ul class="nav-links">
            <li><a href="/">Home</a></li>
            <li><a href="/#shop">Shop</a></li>
            <li><a href="/blog/" class="active">Blog</a></li>
            <li><a href="/#virtual-fitting">Virtual Fitting</a></li>
            <li><a href="/#contact">Contact</a></li>
        </ul>
    </nav>

    <header class="blog-header">
        <h1>The <span>Restored</span> Blog</h1>
        <p>Guides, tips, and stories to help you feel confident and supported on your journey after breast cancer.</p>
    </header>

    <main class="blog-grid">
IDXEOF

    # Append posts
    echo "$posts_html" >> "$BLOG_DIR/index.html"

    cat >> "$BLOG_DIR/index.html" <<'IDXEOF2'

        <div class="signup-box">
            <h3>Stay Connected</h3>
            <p>Get new articles, product updates, and exclusive tips delivered to your inbox.</p>
            <form class="signup-form" action="#" method="POST">
                <input type="email" placeholder="Your email address" required>
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </main>

    <footer>
        <p>&copy; 2026 Restored by Randi. All rights reserved. | <a href="/">Home</a> | <a href="/blog/">Blog</a></p>
    </footer>
</body>
</html>
IDXEOF2

    echo "  Generated: $BLOG_DIR/index.html"
}

# Process files
if [ -n "$1" ]; then
    generate_post "$POSTS_DIR/$1"
else
    for md_file in $POSTS_DIR/*.md; do
        generate_post "$md_file"
    done
fi

generate_index

echo ""
echo "Blog build complete! $(ls $BLOG_DIR/*.html | wc -l) pages generated."
