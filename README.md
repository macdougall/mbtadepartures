# Departures

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## MBTA departure times

- Pulls from the MBTA updated departures CSV file.
- Uses the NimbleCSV package to create an array of departures
- The array is passed to a Phoenix eex template as well as the current time
- The template has a header refresh for every 15 seconds


## Improvements
- Use a process to update the page when the CSV is detected as changed
- Improve the departures board CSS to present the fonts better
- Reorder the departures to have a priority based on "current boarding"