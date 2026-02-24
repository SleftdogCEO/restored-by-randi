# Setup Guide — One-Time Steps (E-Commerce Model)

Complete these steps to launch Restored by Randi online. Estimated total time: 3–4 hours (plus waiting periods for approvals).

---

## 1. Domain & Hosting

### Domain Registration
- [ ] Check availability: [restoredbyrandi.com on Namecheap](https://www.namecheap.com/domains/registration/results/?domain=restoredbyrandi.com)
- [ ] Register domain (~$12/year)
- [ ] Set up DNS to point to GitHub Pages:
  - Add CNAME record: `www` → `sleftdogceo.github.io`
  - Add A records for apex domain:
    - `185.199.108.153`
    - `185.199.109.153`
    - `185.199.110.153`
    - `185.199.111.153`
- [ ] In GitHub repo Settings → Pages → Custom domain: `restoredbyrandi.com`
- [ ] Enable "Enforce HTTPS"

### Alternative: Netlify (easier)
- [ ] Connect repo to [Netlify](https://www.netlify.com/) → auto-deploys on push
- [ ] Add custom domain in Netlify dashboard

---

## 2. Stripe (Payments)

- [ ] Create Stripe account: https://dashboard.stripe.com/register
- [ ] Complete identity verification
- [ ] Create **Payment Links** for each product category:
  - Silicone Breast Form — $299 (average)
  - Mastectomy Bra — $65 (average)
  - Mastectomy Swimwear — $120 (average)
  - Leisure Form — $149 (average)
- [ ] Enable shipping address collection on each payment link
- [ ] Copy each Payment Link URL
- [ ] Replace placeholder URLs in `index.html` (search for `PLACEHOLDER`)

---

## 3. Email

- [ ] Option A (Simple): Set up email forwarding via Namecheap/domain registrar
  - Forward `hello@restoredbyrandi.com` → Randi's Gmail
- [ ] Option B (Professional): Google Workspace ($6/month)
  - https://workspace.google.com/
  - Set up `hello@restoredbyrandi.com`

---

## 4. Shipping Setup

### Shipping Label Service
- [ ] Sign up for **Pirate Ship** (free, pay per label): https://www.pirateship.com/
  - OR **Shippo** (free tier available): https://goshippo.com/
- [ ] Connect to USPS account (Pirate Ship handles this automatically)
- [ ] Set up default package sizes:
  - Small (bras/accessories): 10x8x4" padded mailer
  - Medium (prosthesis + bras): 12x10x6" box
  - Large (multi-item): 14x12x8" box

### Shipping Supplies
- [ ] Order plain shipping boxes (no branding on outside): [Uline](https://www.uline.com/) or Amazon
- [ ] Order branded tissue paper and thank-you cards (optional, nice touch)
- [ ] Order poly mailers for smaller items
- [ ] Get a kitchen/postal scale for weighing packages

### Shipping Policy
- Free shipping on orders over $100
- Flat rate $7.95 under $100
- USPS Priority Mail (2-3 business day delivery)
- Discreet packaging — plain boxes, no product descriptions

---

## 5. Inventory Tracking

### Option A: Google Sheets (Free — Great for Starting)
- [ ] Create a spreadsheet with columns:
  - Product Name | SKU | Size | Color | Quantity on Hand | Reorder Point | Wholesale Cost | Retail Price | Supplier
- [ ] Update manually after each order
- [ ] Set conditional formatting to highlight low stock (at or below reorder point)

### Option B: Shopify Lite / Shopify Starter ($5/month)
- [ ] Sign up: https://www.shopify.com/
- [ ] Add products with photos, descriptions, prices, and inventory counts
- [ ] Shopify auto-decrements inventory on sale
- [ ] Use Shopify's "Buy Button" to embed on your existing site (keeps GitHub Pages)

### Option C: Airtable (Free tier)
- [ ] More powerful than Sheets, visual inventory tracking
- [ ] https://airtable.com/

---

## 6. Google Business Profile

- [ ] Go to https://business.google.com/
- [ ] Create listing for "Restored by Randi"
  - Category: "Medical Supply Store" or "Online Retailer"
  - **Service area:** United States (no physical address shown)
  - Phone: Business phone number
  - Website: restoredbyrandi.com
- [ ] Add product photos
- [ ] Request reviews from early customers

---

## 7. Virtual Consultation Setup

- [ ] Create free Zoom account: https://zoom.us/ (40-min limit on free; upgrade $13/mo if needed)
- [ ] Set up a Calendly for booking: https://calendly.com/
  - Event type: "Free Virtual Sizing Consultation" (30 min)
  - Set availability (Randi's schedule)
- [ ] Add Calendly link to website (replace placeholder in consultation section)
- [ ] Alternative: Accept FaceTime/phone call requests via email

---

## 8. Analytics & Tracking

### Google Analytics
- [ ] Create GA4 property: https://analytics.google.com/
- [ ] Copy Measurement ID (G-XXXXXXXXXX)
- [ ] Replace `GA_MEASUREMENT_ID` in `index.html`

### Facebook Pixel
- [ ] Create pixel in Meta Business Suite: https://business.facebook.com/
- [ ] Copy Pixel ID
- [ ] Replace `PIXEL_ID` in `index.html`

---

## 9. Business Formation (Florida)

- [ ] **LLC Formation:**
  - File online: https://dos.fl.gov/sunbiz/start-business/efile/fl-llc/
  - Cost: $125 filing fee
  - Name: "Restored by Randi LLC"
- [ ] **FL Sales Tax Registration:**
  - https://floridarevenue.com/taxes/taxesfees/Pages/sales_tax.aspx
  - Mastectomy prostheses may be exempt (medical device exemption) — verify
  - Note: May need to collect sales tax on taxable items shipped to FL customers
- [ ] **EIN (Employer Identification Number):**
  - Free from IRS: https://www.irs.gov/businesses/small-businesses-self-employed/apply-for-an-employer-identification-number-ein-online
- [ ] **Business bank account** — Open with EIN at local bank

---

## 10. Supplier Accounts

- [ ] **Amoena:** https://www.amoena.com/us-en/professionals/ — Apply for wholesale account
- [ ] **American Breast Care:** https://www.americanbreastcare.com/become-a-retailer — Contact sales
- [ ] **Trulife:** https://www.trulife.com/become-a-dealer/ — Apply online
- [ ] **Nearly Me / Camp Healthcare:** Call (800) 726-7170 for dealer application
- [ ] **Anita Care:** https://www.anita.com/us/specialist-retailers.html

---

## 11. Email Marketing Setup

- [ ] Sign up for **Mailchimp** (free up to 500 contacts) or **Klaviyo** (better for e-commerce)
- [ ] Create signup form and connect to website
- [ ] Set up automated email sequences:
  - Welcome email (immediately after signup)
  - Post-purchase follow-up (1 day after delivery)
  - Reorder reminder (5-6 months after bra purchase, 11-12 months after prosthesis)
- [ ] Replace email form `action` in `index.html` with your provider's endpoint

---

## 12. Quick Wins Checklist

After completing the above:
- [ ] Post "Now Open — Shop Online!" on Facebook, Instagram
- [ ] Email/call oncologists' offices to share the website (they can refer patients nationwide)
- [ ] Ask early customers for Google reviews
- [ ] Set up Google Shopping ads ($500/month budget to start)
- [ ] Create a "How to Measure" video for YouTube
- [ ] Join breast cancer survivor Facebook groups (be helpful, not salesy)
