defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  
  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @days %{:monday => 1, :tuesday => 2, :wednesday => 3, :thursday => 4, :friday => 5, :saturday => 6, :sunday => 7}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    day = get_day(year, month, weekday, schedule)
    {year, month, day}
  end

  defp get_day(year, month, weekday, :teenth) do
    do_get_day(year, month, weekday, 13..19, 0)
  end

  defp get_day(year, month, weekday, :first) do
    last_day = :calendar.last_day_of_the_month(year, month)
    do_get_day(year, month, weekday, 1..last_day, 0)
  end

  defp get_day(year, month, weekday, :second) do
    last_day = :calendar.last_day_of_the_month(year, month)
    do_get_day(year, month, weekday, 1..last_day, 1)
  end

  defp get_day(year, month, weekday, :third) do
    last_day = :calendar.last_day_of_the_month(year, month)
    do_get_day(year, month, weekday, 1..last_day, 2)
  end

  defp get_day(year, month, weekday, :fourth) do
    last_day = :calendar.last_day_of_the_month(year, month)
    do_get_day(year, month, weekday, 1..last_day, 3)
  end

  defp get_day(year, month, weekday, :last) do
    last_day = :calendar.last_day_of_the_month(year, month)
    do_get_day(year, month, weekday, 1..last_day, -1)
  end

  defp do_get_day(year, month, weekday, range, index) do
    Enum.filter(range, fn(x) ->
      :calendar.day_of_the_week(year, month, x) === @days[weekday] end)
    |> Enum.at(index)
  end

end
