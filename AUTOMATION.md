# Automation Plan — Restored by Randi

Goal: Minimize manual work for both Grant and Randi. Automate everything that doesn't require Randi's personal touch (fittings).

---

## 1. Appointment Booking (Fully Automated)

**Tool:** Calendly (free tier works to start)
- Client books online → auto-confirmation email
- Auto-reminder 24h and 1h before appointment
- Auto-add to Google Calendar
- Intake form collects: name, surgery type, insurance info, sizes if known

**Upgrade path:** Acuity Scheduling ($16/mo) for intake forms, insurance info collection, waivers

---

## 2. Email Sequences (Fully Automated)

**Tool:** Mailchimp (free up to 500 contacts) or ConvertKit

### Sequence 1: New Client Welcome
- **Trigger:** Booking confirmed
- **Email 1 (Immediate):** "What to Expect at Your Fitting" + directions + what to bring
- **Email 2 (Day after fitting):** "Thank you" + care instructions + review request
- **Email 3 (Day 7):** "How are you feeling?" + product care tips
- See templates in `marketing/email-templates/`

### Sequence 2: Reorder Reminders
- **Trigger:** 11 months after bra purchase
- **Email:** "Time for new bras! Your insurance covers 6/year. Book your fitting."
- **Trigger:** 22 months after prosthesis purchase
- **Email:** "Your prosthesis may need replacing. Schedule a check-up."

### Sequence 3: Post-Purchase
- **Trigger:** Online order placed
- **Email 1:** Order confirmation + tracking
- **Email 2 (Day 3):** Shipping update
- **Email 3 (Day 10):** "How's the fit?" + return info + review request

---

## 3. Inventory Management

### Simple Spreadsheet Approach (Start Here)
- Google Sheets with columns: Product, SKU, Qty on Hand, Reorder Point, Supplier
- **Reorder thresholds:**
  - Breast forms: reorder when <3 of any size
  - Bras: reorder when <2 of any size/style
  - Swimwear: reorder when <2 of any style
- Review weekly (set Google Calendar recurring reminder)

### Upgrade Path
- **Square for Retail** (free POS) — auto-tracks inventory on sale
- **Shopify** — if/when moving to full e-commerce, handles inventory natively
- **Low-stock alerts:** Shopify/Square auto-email when stock hits threshold

---

## 4. Insurance Claim Submission

### Manual Process (Start)
1. Collect prescription + insurance card at appointment
2. Verify benefits (call or use Availity: https://www.availity.com/)
3. Submit HCFA-1500 claim form
4. Track in Google Sheet: Patient, Date, Claim #, Amount, Status, Paid Date

### Automated Process (Scale)
- **Brightree** or **TeamHealth DME** — DME-specific billing software
- Auto-submits claims electronically
- Tracks denials and resubmissions
- Cost: $200–$500/month but worth it at >20 claims/month
- **Alternative:** Outsource billing to a DME billing service (~5–8% of collections)

---

## 5. Review Collection (Automated)

**Tool:** Google Review link + automated email

- After every fitting, auto-send email with direct Google Review link
- Google Review link format: `https://search.google.com/local/writereview?placeid=YOUR_PLACE_ID`
- **Goal:** 50+ reviews in first year (huge for local SEO)

**Upgrade:** Birdeye or Podium ($200–$300/month) — auto-texts review requests, manages responses

---

## 6. Social Media Automation

**Tool:** Meta Business Suite (free) or Buffer ($15/month)

- Batch-create 1 month of posts at a time
- Schedule 3–4 posts/week
- Content calendar in `marketing/social-media-plan.md`
- Auto-post to Facebook + Instagram simultaneously

### Content Ideas (Recyclable)
- Product spotlights
- Client testimonials (with permission)
- Educational: "Did you know insurance covers..."
- Behind-the-scenes fitting room setup
- Breast cancer awareness content
- Holiday/seasonal (Mother's Day, Breast Cancer Awareness Month)

---

## 7. Website Automation

### Already Built In
- Static site on GitHub Pages = zero maintenance hosting
- Stripe Payment Links = no backend needed for payments
- Calendly embed = no booking system to maintain

### Future Automations
- **Zapier** connections:
  - New Stripe payment → add to Google Sheet
  - New Calendly booking → add to Google Sheet + send intake form
  - New Google Review → post thank-you comment
- **Chatbot:** Tidio (free tier) for common questions on website

---

## 8. Accounting & Taxes

**Tool:** Wave (free) or QuickBooks ($15/month)

- Connect to business bank account for auto-import
- Stripe auto-syncs with QuickBooks
- Set quarterly tax reminders (FL has no state income tax 🎉)
- Track: sales tax collected, insurance payments, product costs

---

## Automation Priority Order

| Priority | Task | Tool | Cost | Time Saved |
|----------|------|------|------|------------|
| 1 | Appointment booking | Calendly | Free | 3 hrs/week |
| 2 | Email sequences | Mailchimp | Free | 2 hrs/week |
| 3 | Review requests | Auto-email | Free | 1 hr/week |
| 4 | Social media scheduling | Meta Business Suite | Free | 3 hrs/week |
| 5 | Inventory tracking | Google Sheets | Free | 1 hr/week |
| 6 | Accounting | Wave | Free | 2 hrs/week |
| 7 | Insurance billing | Outsource | 5-8% | 5+ hrs/week |

**Total time saved: ~17 hours/week**
**Total cost: $0–$50/month to start**
