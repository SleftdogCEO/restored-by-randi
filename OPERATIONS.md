# OPERATIONS.md — Autonomous 24/7 Business Operating System

## Overview

This document defines the fully automated operating system for the mastectomy boutique business. Every system runs autonomously with minimal human intervention, monitored by OpenClaw cron jobs.

---

## 1. Auto-Content: Weekly Blog Publishing

### Schedule
| Day | Task |
|-----|------|
| Monday | Draft blog post (AI-assisted via OpenClaw) |
| Tuesday | Edit, add images, SEO optimize |
| Wednesday | Publish to WordPress/Shopify blog |
| Thursday | Repurpose → social media snippets |
| Friday | Schedule social posts for next week |

### Content Calendar (Monthly Themes)
- **January:** New year, new confidence — fresh start after surgery
- **February:** Self-love month — body positivity after mastectomy
- **March:** Spring fashion — lightweight prostheses and swimwear preview
- **April:** Breast cancer awareness prep — early content creation
- **May:** Summer fitting guide — swimwear and active prostheses
- **June:** Insurance mid-year reminder — use your benefits
- **July:** Travel tips with prostheses
- **August:** Back-to-routine — fall wardrobe refresh
- **September:** Prosthesis care and maintenance
- **October:** Breast Cancer Awareness Month — major content push
- **November:** Holiday gift guide for survivors
- **December:** Year-end insurance benefit reminder — use it or lose it

### Content Repurposing Pipeline
```
Blog Post
  ├── → 3 Instagram posts (quote cards, tips, product highlights)
  ├── → 1 Facebook long-form post
  ├── → 3-5 Pinterest pins (product images + blog graphics)
  ├── → 1 email newsletter segment
  └── → 1 short-form video script (Reels/TikTok)
```

### Tools
- **WordPress/Shopify Blog** — publishing platform
- **Canva** — graphics templates (batch-create social assets)
- **ChatGPT/Claude** — draft assistance, SEO optimization
- **Grammarly** — final proofread

---

## 2. Auto-Email: Drip Sequences

### Platform: Mailchimp (free tier up to 500 contacts) → Klaviyo (when scaling)

### Sequence 1: Welcome Series
| Email | Timing | Subject |
|-------|--------|---------|
| 1 | Immediate | Welcome to [Business Name] — You're Not Alone |
| 2 | Day 2 | Your First Fitting: What to Expect |
| 3 | Day 5 | Insurance Coverage Guide — We Handle the Paperwork |
| 4 | Day 10 | Meet Our Most Popular Products |
| 5 | Day 14 | Book Your Free Consultation |

### Sequence 2: Post-Purchase
| Email | Timing | Subject |
|-------|--------|---------|
| 1 | Immediate | Order Confirmation + Care Instructions |
| 2 | Day 3 | How to Get the Perfect Fit at Home |
| 3 | Day 7 | How Was Your Experience? (Review Request) |
| 4 | Day 14 | Tips for Daily Comfort |
| 5 | Day 30 | How's Everything Working? Need Adjustments? |

### Sequence 3: Appointment Reminders
| Email | Timing | Subject |
|-------|--------|---------|
| 1 | 7 days before | Your Fitting Appointment is Coming Up |
| 2 | 1 day before | Tomorrow's Appointment — What to Bring |
| 3 | 2 hours before | See You Soon! (SMS via Calendly) |
| 4 | 1 day after | Thank You — Post-Fitting Care Tips |

### Sequence 4: Reorder Reminders
| Email | Timing | Subject |
|-------|--------|---------|
| 1 | 5 months post-purchase (bras) | Time for New Bras? Your Favorites Are Waiting |
| 2 | 6 months post-purchase (bras) | Last Chance — Your Bras May Need Replacing |
| 3 | 11 months post-purchase (prostheses) | Your Prosthesis Check-Up — Is It Time? |
| 4 | 12 months post-purchase (prostheses) | Insurance Covers a New Prosthesis — Let's Get You Fitted |
| 5 | 18 months post-purchase (prostheses) | It's Been 18 Months — Time for a Refresh |

### Sequence 5: No-Show / Abandoned
| Email | Timing | Subject |
|-------|--------|---------|
| 1 | 1 hour after missed | We Missed You Today — Let's Reschedule |
| 2 | Day 3 | Still Thinking About It? We're Here When You're Ready |
| 3 | Day 7 | 10% Off Your First Fitting — Just for You |

---

## 3. Auto-Social: Scheduling & Distribution

### Platform: Buffer (free tier: 3 channels, 10 scheduled posts) → Later (upgrade path)

### Posting Schedule
| Platform | Frequency | Best Times | Content Type |
|----------|-----------|------------|--------------|
| Instagram | 4x/week | Tue/Thu 10am, Sat 9am, Sun 11am | Product photos, fitting tips, testimonials, Reels |
| Facebook | 3x/week | Tue/Thu/Sat 11am | Blog excerpts, community stories, events |
| Pinterest | 5x/week | Daily 8pm | Product pins, blog graphics, outfit ideas |

### Content Sources
1. Blog posts → extract 3 social snippets each
2. Customer testimonials (with permission) → quote cards
3. Product photography → styled flat lays, on-body shots
4. Educational content → insurance tips, fitting guides
5. Behind-the-scenes → fitting room prep, new inventory arrivals

### Hashtag Strategy
```
Core: #mastectomy #breastcancersurvivor #mastectomyboutique #breastprosthesis
Product: #mastectomybra #mastectomyswimwear #breastform #prosthesis
Community: #cancersurvivor #breastcancerawareness #survivorstrong #bodypositive
Local: #[city]boutique #[state]mastectomy #localsmallbusiness
```

---

## 4. Auto-Reviews: Post-Purchase Review Requests

### Workflow
```
Purchase Complete
  → Day 7: Email requesting Google review (direct link)
  → Day 10: If no review → SMS reminder (optional)
  → Day 14: Email requesting Yelp review (alternate link)
  → Day 30: Thank you email regardless of review status
```

### Tools
- **Google Business Profile** — primary review platform
- **Yelp Business** — secondary platform
- **Mailchimp/Klaviyo** — automated email triggers
- **Grade.us or Podium** (future) — review management platform

### Review Request Template
> Hi [Name], it's been a week since your fitting at [Business Name]. We hope you're feeling confident and comfortable! If you have a moment, would you share your experience? Your words help other women find the support they need.
>
> [⭐ Leave a Google Review](link)
>
> Thank you for being part of our community. 💕

---

## 5. Auto-Reorder: Inventory Management

### Inventory Thresholds
| Product Category | Min Stock | Reorder Qty | Supplier | Lead Time |
|-----------------|-----------|-------------|----------|-----------|
| Silicone Prostheses (per size) | 2 | 6 | Amoena | 5-7 days |
| Foam Prostheses (per size) | 3 | 10 | Trulife | 3-5 days |
| Mastectomy Bras (per size) | 3 | 12 | ABC | 5-7 days |
| Mastectomy Swimwear (per size) | 2 | 6 | Amoena | 7-10 days |
| Leisure Forms | 3 | 8 | Trulife | 3-5 days |
| Camisoles/Shapers | 2 | 6 | ABC | 5-7 days |

### Auto-Reorder Workflow
```
Daily Inventory Check (OpenClaw cron)
  → If stock < minimum threshold
    → Generate Purchase Order (PO) draft
    → Email PO to supplier (or submit via supplier portal)
    → Log in inventory spreadsheet
    → Notify owner via Discord/SMS
    → Update expected delivery date
```

### Supplier Contacts
| Supplier | Portal | Rep Contact | Account # |
|----------|--------|-------------|-----------|
| Amoena | amoena.com/retailer | [TBD] | [TBD] |
| ABC (American Breast Care) | americanbreastcare.com | [TBD] | [TBD] |
| Trulife | trulife.com | [TBD] | [TBD] |

---

## 6. Auto-Scheduling: Appointment Management

### Platform: Calendly (free tier → Pro at scale)

### Appointment Types
| Type | Duration | Price | Buffer |
|------|----------|-------|--------|
| Initial Consultation & Fitting | 60 min | Free / $75 (applied to purchase) | 15 min |
| Follow-Up Fitting | 30 min | Free | 10 min |
| Bra Fitting Only | 30 min | Free with purchase | 10 min |
| Insurance Verification Call | 15 min | Free | 5 min |
| Virtual Consultation | 30 min | Free | 5 min |

### Automated Workflow
```
Booking Made (Calendly)
  → Instant: Confirmation email + calendar invite
  → Instant: Insurance verification trigger (see Auto-Insurance)
  → 7 days before: Reminder email
  → 1 day before: Reminder email + what to bring
  → 2 hours before: SMS reminder
  → After appointment: Thank you + care tips email
  → 7 days after: Review request email

No-Show:
  → 1 hour after: "We missed you" email
  → 3 days after: Follow-up email
  → 7 days after: Incentive offer to rebook
```

### Availability Settings
- **Hours:** Mon-Fri 9am-5pm, Sat 10am-2pm
- **Max appointments/day:** 6
- **Minimum notice:** 24 hours
- **Cancellation policy:** 24-hour notice required

---

## 7. Auto-Insurance: Coverage Verification

### Pre-Appointment Workflow
```
Appointment Booked
  → Collect: Insurance provider, policy #, group #, subscriber info
  → Auto-verify via phone/portal (manual initially, automate with Availity)
  → Check coverage for:
      - Breast prostheses (HCPCS L8030-L8039)
      - Mastectomy bras (HCPCS A4280)
      - Custom prostheses (L8035)
  → Document: copay, deductible status, authorization requirements
  → Email patient: "Your insurance covers [X], your estimated cost is [Y]"
  → Flag if: prior authorization needed, out-of-network, no coverage
```

### Insurance Verification Checklist
- [ ] Patient insurance card (front/back)
- [ ] Verify active coverage
- [ ] Check DME (Durable Medical Equipment) benefits
- [ ] Confirm prosthesis/bra coverage amounts
- [ ] Check if prior authorization required
- [ ] Verify in-network status
- [ ] Calculate patient responsibility (copay/coinsurance/deductible)
- [ ] Document everything in patient file

### Common Insurance Notes
- **Medicare:** Covers 1 prosthesis per year, 3 bras per year (every 6 months for bras)
- **Medicaid:** Varies by state — verify each time
- **Private insurance:** Most cover under DME with prescription
- **Required:** Prescription/order from physician for insurance billing

---

## 8. Auto-SEO: Search Engine Optimization

### Monthly SEO Tasks
| Week | Task |
|------|------|
| Week 1 | Rank tracking — check positions for target keywords |
| Week 2 | Content gap analysis — find new keyword opportunities |
| Week 3 | Technical SEO audit — broken links, page speed, mobile |
| Week 4 | Backlink outreach — cancer centers, survivor blogs, healthcare directories |

### Target Keywords
| Keyword | Priority | Current Rank | Target |
|---------|----------|-------------|--------|
| mastectomy boutique near me | High | — | Top 3 |
| breast prosthesis fitting | High | — | Top 5 |
| mastectomy bras [city] | High | — | Top 3 |
| breast forms after mastectomy | Medium | — | Top 10 |
| mastectomy swimwear | Medium | — | Top 10 |
| insurance covered breast prosthesis | High | — | Top 5 |
| post-mastectomy products | Medium | — | Top 10 |

### Tools
- **Google Search Console** — free rank tracking + indexing
- **Ubersuggest** — free tier keyword research
- **Google Analytics 4** — traffic analysis
- **Screaming Frog** (free tier) — technical audit (500 URLs)

### Local SEO
- Google Business Profile — fully optimized, weekly posts
- Yelp Business — claimed, photos, responded to reviews
- Healthcare directories — Healthgrades, Vitals, WebMD
- Cancer support directories — local cancer centers, ACS chapters

---

## 9. Auto-Customer Support: FAQ Chatbot

### Platform: Tidio (free tier — 50 conversations/month)

### Chatbot Flows
1. **Welcome:** "Hi! Welcome to [Business Name]. How can I help you today?"
2. **Fitting Appointment:** → Calendly booking link
3. **Insurance Questions:** → Insurance FAQ page + offer verification call
4. **Product Questions:** → Product category links
5. **Hours & Location:** → Address, hours, map link
6. **Post-Surgery Support:** → Resource page + book consultation
7. **Order Status:** → Order tracking link
8. **Returns/Exchanges:** → Return policy + contact form

### Escalation Rules
- If chatbot can't resolve → email notification to owner
- If customer expresses frustration → immediate human handoff
- If insurance question is complex → schedule verification call
- After hours → collect email, respond next business day

---

## 10. OpenClaw Cron Job Specifications

### Daily Jobs

#### Daily Inventory Check
```
Schedule: Every day at 8:00 AM EST
Task: Check inventory levels against thresholds
Action: If below minimum → generate PO draft, notify via Discord
Model: claude-sonnet (cost-efficient)
```

### Weekly Jobs

#### Weekly Blog Publish
```
Schedule: Every Wednesday at 9:00 AM EST
Task: Finalize draft blog post, optimize SEO, publish
Action: Publish to site, trigger social repurpose pipeline
Model: claude-sonnet
```

#### Weekly Social Media Batch
```
Schedule: Every Thursday at 10:00 AM EST
Task: Generate social posts from latest blog, schedule in Buffer
Action: Create 4 Instagram, 3 Facebook, 5 Pinterest posts
Model: claude-sonnet
```

### Monthly Jobs

#### Monthly Revenue Report
```
Schedule: 1st of every month at 9:00 AM EST
Task: Pull sales data, insurance reimbursements, expenses
Action: Generate revenue report, compare to projections, notify owner
Model: claude-sonnet
```

#### Monthly SEO Report
```
Schedule: 15th of every month at 9:00 AM EST
Task: Pull rank tracking data, analyze traffic trends
Action: Generate SEO report with recommendations
Model: claude-sonnet
```

### Quarterly Jobs

#### Quarterly Insurance Rate Review
```
Schedule: Jan 1, Apr 1, Jul 1, Oct 1 at 9:00 AM EST
Task: Review insurance reimbursement rates, check for policy changes
Action: Update billing rates, flag any coverage changes, notify owner
Model: claude-opus (complex analysis)
```

#### Quarterly Business Review
```
Schedule: Jan 15, Apr 15, Jul 15, Oct 15 at 9:00 AM EST
Task: Comprehensive business performance review
Action: Revenue vs projections, customer growth, inventory turnover, marketing ROI
Model: claude-opus
```

---

## System Integration Map

```
┌─────────────────────────────────────────────────┐
│                   OpenClaw                        │
│            (Orchestration Layer)                  │
├──────────┬──────────┬──────────┬────────────────┤
│          │          │          │                  │
▼          ▼          ▼          ▼                  ▼
Shopify   Calendly  Mailchimp  Buffer         Google Biz
(Store)   (Booking) (Email)    (Social)       (Reviews)
│          │          │          │                  │
▼          ▼          ▼          ▼                  ▼
Orders → Appointments → Drips → Posts →      Review Requests
│          │                                       │
▼          ▼                                       ▼
Inventory  Insurance                          Reputation
Tracking   Verification                      Management
```

---

## Key Metrics to Track

| Metric | Target (Month 1-3) | Target (Month 6) | Target (Year 1) |
|--------|--------------------|--------------------|------------------|
| Website visitors | 500/mo | 2,000/mo | 5,000/mo |
| Email subscribers | 50 | 300 | 1,000 |
| Appointments booked | 10/mo | 30/mo | 60/mo |
| Google reviews | 5 | 20 | 50+ |
| Social followers (total) | 200 | 1,000 | 3,000 |
| Conversion rate | 2% | 3% | 4% |
| Customer retention rate | — | 40% | 60% |

---

*This operating system runs 24/7 with minimal intervention. OpenClaw monitors, executes, and reports. The owner focuses on fittings, relationships, and growth.*
