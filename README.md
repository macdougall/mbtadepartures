# Departures

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## MBTA departure times

A very simple Elixir and Phoenix application to mimic the departures board that is shown at the MBTA Commuter line stations (North Station, South Station, etc.)

- Uses Httpc.request to get the MBTA updated departures CSV file
- Uses the NimbleCSV package to create a map of departure information
- The CSV row consists of static data that's converted to a map
- The map is passed to a Phoenix eex template as well as the current time
- Uses the Timex package to get convert the epoch timestamp to EST time
- The template has a header refresh for every 15 seconds
- The overall display mimics the boards that are shown at South Station/North Station
- Font used is "LED" and the overall layout is embedded in the templateß

## Improvements
- Improve the departures board CSS to present fonts better and overall UI beutification
- Use a process to update the page when the CSV is detected as changed not a header refresh
- Reorder the departures to have a priority based on "current boarding"