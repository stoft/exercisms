defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  
  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @days %{:monday => 1, :tuesday => 2, :wednesday => 3, :thursday => 4, :friday => 5, :saturday => 6, :sunday => 7}

  @index %{:teenth => 0, :first => 0, :second => 1, :third => 2, :fourth => 3, :last => -1}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    range = get_range(year, month, schedule)
    day = get_day(year, month, weekday, range, @index[schedule])
    {year, month, day}
  end

  defp get_range(_year, _month, :teenth), do: 13..19
  defp get_range(year, month, _schedule) do
    1 .. :calendar.last_day_of_the_month(year, month)
  end

  defp get_day(year, month, weekday, range, index) do
    Enum.filter(range, fn(x) ->
      :calendar.day_of_the_week(year, month, x) === @days[weekday] end)
    |> Enum.at(index)
  end

end
