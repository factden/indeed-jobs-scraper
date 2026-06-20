#!/usr/bin/env bash
# Run the Indeed Jobs Scraper on Apify and download the results with cURL.
# Get a free API token from your Apify account: https://console.apify.com/account/integrations
set -euo pipefail

APIFY_TOKEN="YOUR_APIFY_TOKEN"

# Run the Actor synchronously and stream the resulting dataset items as JSON.
curl -s -X POST \
  "https://api.apify.com/v2/acts/factden~indeed-jobs-scraper/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H 'Content-Type: application/json' \
  -d '{
        "query": "software engineer",
        "location": "New York, NY",
        "country": "US",
        "salaryMin": 150000,
        "maxItems": 200,
        "scrapeCompany": true
      }'
