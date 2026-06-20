"""Run the Indeed Jobs Scraper on Apify from Python.

  pip install apify-client

Get a free API token from your Apify account: https://console.apify.com/account/integrations
"""

from apify_client import ApifyClient

client = ApifyClient("YOUR_APIFY_TOKEN")

run_input = {
    "query": "software engineer",
    "location": "New York, NY",
    "country": "US",
    "salaryMin": 150000,
    "maxItems": 200,
    "scrapeCompany": True,
}

run = client.actor("factden/indeed-jobs-scraper").call(run_input=run_input)

# Jobs dataset (the run's default dataset)
for job in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(job["title"], "—", job.get("company"), "—", job.get("salary"))
