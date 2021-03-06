defmodule Gigasecond do

	@gigasecond 1_000_000_000

	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date
	def from({year, month, day}) do
		{{year, month, day},{0,0,0}}
			|> :calendar.datetime_to_gregorian_seconds
			|> + @gigasecond
			|> :calendar.gregorian_seconds_to_datetime
			|> elem 0
	end
end