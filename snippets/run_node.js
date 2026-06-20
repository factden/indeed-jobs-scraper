// Run the Indeed Jobs Scraper on Apify from Node.js.
//
//   npm install apify-client
//
// Get a free API token from your Apify account: https://console.apify.com/account/integrations

import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: 'YOUR_APIFY_TOKEN' });

const input = {
    query: 'software engineer',
    location: 'New York, NY',
    country: 'US',
    salaryMin: 150000,
    maxItems: 200,
    scrapeCompany: true,
};

const run = await client.actor('factden/indeed-jobs-scraper').call(input);

const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const job of items) {
    console.log(`${job.title} — ${job.company ?? ''} — ${job.salary ?? ''}`);
}
