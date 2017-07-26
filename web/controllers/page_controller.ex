defmodule Departures.PageController do
  require IEx
  use Departures.Web, :controller
  use Timex
  # Retrieve from URL, a CSV of departure times.
  # Returns a new map with the departure times parsed from a CSV.
  def departures() do
    {:ok, resp} = :httpc.request(:get, {'http://developer.mbta.com/lib/gtrtfs/Departures.csv', []}, [], [body_format: :binary])
    {{_, 200, 'OK'}, _headers, body} = resp
    NimbleCSV.define(CSVParser, separator: ",", escape: "\"")
    CSVParser.parse_string(body)
    |> Enum.map(fn [timestamp,origin,trip,destination,scheduledtime,lateness,track,status] -> 
      %{timestamp: timestamp, origin: origin, trip: trip, destination: destination,scheduledtime: scheduledtime,lateness: lateness, track: track, status: status} 
    end)
  end

  def index(conn, _params) do
    time = Timex.format!(Timex.local, "%H:%M", :strftime)
    render conn, "index.html", departures: departures(), clock: time
  end
end
