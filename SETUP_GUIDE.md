# Setup Guide — One-Time Steps

Complete these steps to launch Restored by Randi. Estimated total time: 4–6 hours (plus waiting periods for approvals).

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
- [ ] Copy each Payment Link URL
- [ ] Replace placeholder URLs in `index.html` (search for `STRIPE_PAYMENT_LINK`)

---

## 3. Email

- [ ] Option A (Simple): Set up email forwarding via Namecheap/domain registrar
  - Forward `hello@restoredbyrandi.com` → Randi's Gmail
- [ ] Option B (Professional): Google Workspace ($6/month)
  - https://workspace.google.com/
  - Set up `hello@restoredbyrandi.com`

---

## 4. Google Business Profile

- [ ] Go to https://business.google.com/
- [ ] Create listing for "Restored by Randi"
  - Category: "Mastectomy Fitter" or "Medical Supply Store"
  - Address: West Palm Beach, FL (use business address)
  - Phone: Business phone number
  - Website: restoredbyrandi.com
  - Hours: By appointment
- [ ] Add photos (storefront, fitting room, products)
- [ ] Request reviews from early clients

---

## 5. Calendly (Appointment Booking)

- [ ] Create free Calendly account: https://calendly.com/
- [ ] Set up event type: "Private Fitting Appointment" (60 min)
- [ ] Set availability (Randi's schedule)
- [ ] Copy embed URL
- [ ] Replace `CALENDLY_URL` placeholder in `index.html`

---

## 6. Analytics & Tracking

### Google Analytics
- [ ] Create GA4 property: https://analytics.google.com/
- [ ] Copy Measurement ID (G-XXXXXXXXXX)
- [ ] Replace `GA_MEASUREMENT_ID` in `index.html`

### Facebook Pixel
- [ ] Create pixel in Meta Business Suite: https://business.facebook.com/
- [ ] Copy Pixel ID
- [ ] Replace `FB_PIXEL_ID` in `index.html`

---

## 7. Business Formation (Florida)

- [ ] **LLC Formation:**
  - File online: https://dos.fl.gov/sunbiz/start-business/efile/fl-llc/
  - Cost: $125 filing fee
  - Name: "Restored by Randi LLC"
- [ ] **Business Tax Receipt** (local business license):
  - Apply through West Palm Beach city: https://www.wpb.org/business
  - Cost: ~$50–$150/year
- [ ] **FL Sales Tax Registration:**
  - https://floridarevenue.com/taxes/taxesfees/Pages/sales_tax.aspx
  - Mastectomy prostheses may be exempt (medical device exemption) — verify
- [ ] **EIN (Employer Identification Number):**
  - Free from IRS: https://www.irs.gov/businesses/small-businesses-self-employed/apply-for-an-employer-identification-number-ein-online
- [ ] **Business bank account** — Open with EIN at local bank

---

## 8. Insurance Billing Setup (Do This for Maximum Revenue)

This is the single biggest revenue unlock. Most patients expect insurance coverage.

### Step 1: Get NPI Number (Free, takes 1–2 days)
- [ ] Apply: https://nppes.cms.hhs.gov/
- [ ] Select: Organization (if LLC) or Individual
- [ ] Taxonomy code: 332B00000X (Durable Medical Equipment & Medical Supplies)

### Step 2: DME Accreditation (Required for Medicare — takes 3–6 months)
- [ ] Choose accreditor:
  - **ABC (American Board for Certification):** https://www.abcop.org/ — most common
  - **BOC:** https://www.bocusa.org/
- [ ] Cost: $2,000–$5,000
- [ ] They'll inspect your facility and processes
- [ ] You CAN sell products while waiting — just can't bill Medicare yet

### Step 3: Medicare Enrollment
- [ ] Apply via PECOS: https://pecos.cms.hhs.gov/
- [ ] Need: NPI, accreditation, surety bond ($50,000 — costs ~$500–$1,500/year from a bonding company)
- [ ] Timeline: 60–90 days after application

### Step 4: Florida Medicaid Enrollment
- [ ] Apply: https://portal.flmmis.com/FLPublic/
- [ ] Need: NPI, state license, accreditation

### Step 5: Private Insurance Credentialing
- [ ] Apply to major networks: Aetna, BCBS, Cigna, UnitedHealthcare, Humana
- [ ] Use a credentialing service to save time (~$500–$1,000): CAQH ProView
- [ ] Or bill out-of-network and help patients submit for reimbursement (easier to start)

### Shortcut: Start Without Medicare
- Bill private insurance out-of-network (patient submits for reimbursement)
- Accept cash/credit card payments
- Begin accreditation process immediately
- Full insurance billing within 6 months

---

## 9. Supplier Accounts

- [ ] **Amoena:** https://www.amoena.com/us-en/professionals/ — Apply for wholesale account
- [ ] **American Breast Care:** https://www.americanbreastcare.com/become-a-retailer — Contact sales
- [ ] **Trulife:** https://www.trulife.com/become-a-dealer/ — Apply online
- [ ] **Nearly Me / Camp Healthcare:** Call (800) 726-7170 for dealer application
- [ ] **Anita Care:** https://www.anita.com/us/specialist-retailers.html

---

## 10. Quick Wins Checklist

After completing the above:
- [ ] Post "Now Open" on Facebook, Instagram
- [ ] Email/call 5 local oncologists' offices to introduce yourself
- [ ] Drop off brochures at cancer centers
- [ ] Ask 3 past clients for Google reviews
- [ ] Set up Google Ads ($500/month budget to start)
