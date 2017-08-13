defmodule Departures.LayoutView do
  use Departures.Web, :view
  use Timex

  # function to return the formatted value of a timestamp (epoch) in readable form.
  def get_time(epoch) do
    if is_binary(epoch) do
      Timex.format!(Timex.from_unix(String.to_integer(epoch)), "%I:%M %p", :strftime)
    end
  end 

end
