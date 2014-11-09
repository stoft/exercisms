defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  
  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third 
                  | :fourth | :last | :teenth

  @days %{:monday     => 1,
          :tuesday    => 2,
          :wednesday  => 3,
          :thursday   => 4,
          :friday     => 5,
          :saturday   => 6,
          :sunday     => 7}

  @week_index %{ :teenth => 0, # edge case
                 :first  => 0,
                 :second => 1,
                 :third  => 2,
                 :fourth => 3,
                 :last   => -1}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    day = generate_days_in_month(year, month, schedule)
    |> select_all_weekday_in_month(year, month, @days[weekday])
    |> select_specific_week(@week_index[schedule])
    {year, month, day}
  end

  defp generate_days_in_month(_year, _month, :teenth), do: 13..19 #edge case
  defp generate_days_in_month(year, month, _schedule) do
    1 .. :calendar.last_day_of_the_month(year, month)
  end

  defp select_all_weekday_in_month(day_range, year, month, weekday) do
    Enum.filter(day_range, fn(x) ->
      :calendar.day_of_the_week(year, month, x) == weekday end)    
  end

  defp select_specific_week(list_of_weeks, week_index) do
    Enum.at(list_of_weeks, week_index)
  end

end
