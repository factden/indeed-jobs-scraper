# Indeed Jobs Scraper — salaries, filters & free company data

[![Run on Apify](https://img.shields.io/badge/Run%20on-Apify-2bd17e?logo=apify&logoColor=white)](https://apify.com/factden/indeed-jobs-scraper?fpr=factden)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Scrape **Indeed** job listings at scale — with **salaries**, full descriptions, and **free company profiles** —
across **60+ countries**, with a **native salary-range filter** no other scraper offers. No login, no proxy setup,
no CAPTCHA work.

This repo is the **open documentation** for the hosted
**[Indeed Jobs Scraper](https://apify.com/factden/indeed-jobs-scraper?fpr=factden)** on Apify — field dictionary,
how-to guide, copy-paste input examples, and Python / Node / cURL snippets. The scraper itself runs as a managed
Actor on Apify (nothing to install or maintain).

<p align="center">
  <a href="https://apify.com/factden/indeed-jobs-scraper?fpr=factden">
    <img src="https://raw.githubusercontent.com/factden/apify-actor-assets/main/indeed-jobs-scraper/02-output-jobs-overview.png"
         width="900"
         alt="Indeed Jobs Scraper output — table of jobs with title, company, rating, reviews, category, location, salary, type, remote, and date posted">
  </a>
</p>

## Why this one

- 🏆 **Native salary-range filter** — filter at the source by min/max annual salary. Most scrapers make you pull
  everything and filter afterward.
- 🏆 **Every result page** — auto date-window sharding breaks past Indeed's ~1,000-result depth ceiling, with honest
  *retrieved-vs-estimated* coverage reporting.
- 🏆 **Free company profiles** — rating, reviews, size, industry, CEO, founded, revenue, website, and socials, in a
  **separate dataset you are not billed for**.
- 🏆 **Reliable & no-setup** — no login, no proxy config, no anti-bot tuning, no CAPTCHA handling.

## 30-second start

1. Open the **[Actor on Apify](https://apify.com/factden/indeed-jobs-scraper?fpr=factden)** and click **Try for free**.
2. Set a **keyword** + **location**, pick a **country**, click **Start**.
3. Download results as **JSON / CSV / Excel**, or pull them via the [Apify API](https://docs.apify.com/api/v2).

New Apify accounts get a **$5 free credit (~2,500 jobs)** on the first run.

## Documentation in this repo

| File | What's in it |
|---|---|
| **[FIELDS.md](FIELDS.md)** | Full data dictionary — every Jobs and Companies field, with types |
| **[HOWTO.md](HOWTO.md)** | How to scrape Indeed jobs: search, filter by salary, go past the 1,000 cap, schedule |
| **[examples/](examples/)** | Copy-paste input configs + illustrative output rows |
| **[snippets/](snippets/)** | Run the Actor from Python, Node.js, or cURL via the public Apify API |
| **[sample/](sample/)** | 100-row preview of the free sample dataset (full version on HuggingFace + Kaggle) |

## Output at a glance

Two datasets, joinable by `companyKey`. Company rows are **free** — you pay per job only. See
**[FIELDS.md](FIELDS.md)** for the complete schema and **[examples/](examples/)** for full sample rows.

```jsonc
// Jobs (one row per listing)
{ "jobKey": "…", "title": "Senior Software Engineer", "company": "Plaid",
  "salaryMin": 120000, "salaryMax": 160000, "currency": "USD",
  "location": "New York, NY", "remote": "remote", "datePosted": "2026-06-10",
  "url": "https://www.indeed.com/viewjob?jk=…" }

// Companies (free, when enabled)
{ "companyKey": "…", "company": "Plaid", "rating": 4.1, "reviewCount": 312,
  "industry": "Internet and Software", "employees": "1,001-5,000", "website": "https://plaid.com" }
```

## 📊 Free sample dataset

A ready-made **1,000-job + 536-company** sample (CSV + JSONL), collected with this Actor and joinable by `companyKey`:

[![Indeed Jobs Dataset 2026](https://raw.githubusercontent.com/factden/apify-actor-assets/main/indeed-jobs-scraper/cover.png)](https://huggingface.co/datasets/fact-den/indeed-job-postings-2026)

- 🤗 **HuggingFace:** [fact-den/indeed-job-postings-2026](https://huggingface.co/datasets/fact-den/indeed-job-postings-2026)
- 📊 **Kaggle:** [indeed-jobs-2026-salaries-company-data](https://www.kaggle.com/datasets/factden/indeed-jobs-2026-salaries-company-data)
- 📁 **In this repo:** [`sample/jobs.sample.csv`](sample/jobs.sample.csv) · [`sample/companies.sample.csv`](sample/companies.sample.csv) — 100-row preview

Need fresh, larger, or filtered data (60+ countries)? **[Run the Actor](https://apify.com/factden/indeed-jobs-scraper?fpr=factden)**.

## Pricing

Pay-per-event: **$0.01 per run + $2 per 1,000 job rows**. Company-profile rows are **free**. Tiered plan discounts
apply automatically down to **$1.20 / 1,000** on Business. See the
[Actor page](https://apify.com/factden/indeed-jobs-scraper?fpr=factden) for current pricing.

## FAQ

**Does it get all jobs or just the first page?** All result pages up to your `maxItems`; it auto-shards by date window
to break past Indeed's ~1,000-result depth ceiling and reports retrieved-vs-estimated totals.

**Can I filter by salary?** Yes — a native `salaryMin` / `salaryMax` range filter, which most Indeed scrapers can't do.

**Is company data really free?** Yes. Company profiles go to a separate dataset that isn't billed.

**Do I need an Indeed account or proxies?** No login, account, or proxy setup required.

**Is scraping Indeed legal?** The Actor collects only publicly available data. Personal data is protected by GDPR (EU)
and similar laws — don't collect personal data without a legitimate basis, and follow Indeed's terms and applicable
law. See Apify's guide: [is web scraping legal?](https://blog.apify.com/is-web-scraping-legal/).

## More from factden

- **[G2 Reviews Scraper](https://apify.com/factden/g2-reviews-scraper?fpr=factden)** — B2B SaaS reviews, battlecards &
  switching data.
- **[Trip.com & Ctrip Hotel Reviews Scraper](https://apify.com/factden/ctrip-trip-reviews-scraper?fpr=factden)** —
  hospitality review data.

---

Built by **[factden](https://apify.com/factden?fpr=factden)**. Outbound links to Apify may be affiliate links.
