# How to scrape Indeed jobs (with salaries and company data)

A practical guide to pulling structured Indeed data with the
**[Indeed Jobs Scraper](https://apify.com/factden/indeed-jobs-scraper?fpr=factden)** — by keyword search, by salary
range, past Indeed's 1,000-result ceiling, and on a schedule. No login, proxies, or anti-bot work required.

## 1. The simplest run

Set a keyword and a location and start. Everything else has sensible defaults.

```json
{ "query": "software engineer", "location": "New York, NY", "country": "US", "maxItems": 100 }
```

The `location` must belong to the chosen `country`. Pick the country from the 60+ supported Indeed sites
(US, GB, CA, AU, IN, DE, FR, …).

## 2. Filter by salary (the native filter)

Most Indeed scrapers can't filter by pay — they make you pull everything and filter afterward. This one filters at
the source:

```json
{ "query": "data engineer", "location": "San Francisco, CA", "salaryMin": 150000, "maxItems": 500 }
```

`salaryMin` / `salaryMax` are **annual** figures. Combine them to bracket a band.

## 3. Fresh and remote roles only

```json
{ "query": "product manager", "location": "Remote", "remote": "remote", "datePosted": "7", "sort": "date" }
```

`datePosted` accepts `1`, `3`, `7`, or `14` (days). `remote` accepts `remote` or `hybrid`. `sort` is `relevance`
or `date`.

## 4. Add free company profiles

Toggle `scrapeCompany` (on by default) to get a second, **unbilled** dataset of employer firmographics — rating,
reviews, size, industry, CEO, founded, revenue, website, socials. Join it to jobs on `companyKey`.

```json
{ "query": "registered nurse", "location": "Chicago, IL", "scrapeCompany": true, "maxItems": 200 }
```

## 5. Go past Indeed's ~1,000-result ceiling

Indeed only pages ~1,000 results deep per search. Set `maxItems` higher (or `0` for no cap) and the Actor
auto-shards the search by date window to retrieve more, then reports retrieved-vs-estimated totals so you know your
coverage.

```json
{ "query": "nurse", "location": "Texas", "country": "US", "maxItems": 0 }
```

## 6. Look up known jobs by key

Already have job keys (the `jk=` value from a `viewjob` URL)? Fetch them directly — fast and exact, with or without
a search.

```json
{ "jobKeys": ["6e4040455f842cbd", "cc2175979cc7dfce"], "scrapeCompany": true }
```

You can also pass full Indeed search or job URLs via `startUrls`.

## 7. Run it as an API / on a schedule

The Actor doubles as an Indeed jobs API. Call it from the [Apify API](https://docs.apify.com/api/v2) or the
[Python](https://docs.apify.com/api/client/python) / [JS](https://docs.apify.com/api/client/js) clients, and use
Apify [Schedules](https://docs.apify.com/platform/schedules) + [Webhooks](https://docs.apify.com/platform/integrations/webhooks)
for incremental pulls — set `datePosted` to `1` and run daily. See [snippets/](snippets/) for runnable code.

## Field reference

Every output field is documented in **[FIELDS.md](FIELDS.md)**.
