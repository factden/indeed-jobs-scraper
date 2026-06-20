# Data dictionary

The **[Indeed Jobs Scraper](https://apify.com/factden/indeed-jobs-scraper?fpr=factden)** writes to two datasets:
**Jobs** (billed) and **Companies** (free, optional). They join on `companyKey`. Field values below are
**illustrative** — actual values come from Indeed's public listings at run time.

## Jobs dataset

One row per job listing. The full description is inline (no extra request).

| Field | Type | Description |
|---|---|---|
| `jobKey` | string | Indeed's unique job id (the `jk=` value). Use it for exact re-lookup. |
| `title` | string | Job title. |
| `company` | string \| null | Employer name. |
| `companyRating` | number \| null | Employer's Indeed rating (0–5). |
| `companyReviewCount` | integer \| null | Number of employer reviews on Indeed. |
| `companyPageUrl` | string \| null | URL of the employer's Indeed company page. |
| `location` | string \| null | Display location as shown on Indeed. |
| `city` | string \| null | Parsed city. |
| `state` | string \| null | Parsed state / region. |
| `countryCode` | string \| null | ISO country code. |
| `latitude` | number \| null | Approximate latitude. |
| `longitude` | number \| null | Approximate longitude. |
| `salary` | string \| null | Salary text exactly as shown (e.g. `"$120,000 - $160,000 a year"`). |
| `salaryMin` | integer \| null | Parsed lower bound. |
| `salaryMax` | integer \| null | Parsed upper bound. |
| `salaryPeriod` | string \| null | `YEAR`, `MONTH`, `WEEK`, `DAY`, or `HOUR`. |
| `currency` | string \| null | Salary currency (e.g. `USD`). |
| `jobType` | array | Employment types (e.g. `["Full-time"]`). |
| `occupations` | array | Indeed's job-category taxonomy (e.g. `["Back End Developers"]`). |
| `remote` | string \| null | `remote`, `hybrid`, or null. |
| `datePosted` | string \| null | ISO date the listing was posted. |
| `benefits` | array | Listed benefits (e.g. `["Health insurance", "401(k)"]`). |
| `description` | string | Full job description text. |
| `isUrgentHire` | boolean \| null | Whether Indeed flags the role as urgent. |
| `easyApply` | boolean \| null | Whether the listing supports Indeed Easy Apply. |
| `url` | string | Canonical `viewjob` URL for the listing. |

## Companies dataset

One deduped row per unique employer, written only when `scrapeCompany` is enabled. **Free** — not billed.

| Field | Type | Description |
|---|---|---|
| `companyKey` | string | Unique employer id — join key to the Jobs dataset. |
| `company` | string \| null | Employer name. |
| `rating` | number \| null | Overall Indeed rating (0–5). |
| `reviewCount` | integer \| null | Number of reviews. |
| `industry` | string \| null | Industry classification. |
| `employees` | string \| null | Headcount band (e.g. `"1,001-5,000"`). |
| `revenue` | string \| null | Revenue band (e.g. `"$100M-$500M"`). |
| `ceo` | string \| null | CEO name, when published. |
| `founded` | integer \| null | Year founded. |
| `website` | string \| null | Company website. |
| `companyPageUrl` | string \| null | Employer's Indeed company page. |
| `facebook` | string \| null | Facebook URL, when published. |
| `twitter` | string \| null | Twitter / X URL, when published. |
| `instagram` | string \| null | Instagram URL, when published. |

## Joining the two datasets

Each job carries the employer identity; the Companies dataset has one row per employer keyed by `companyKey`.
Left-join Jobs → Companies on `companyKey` to attach firmographics to every job without paying for duplicate
company rows.
