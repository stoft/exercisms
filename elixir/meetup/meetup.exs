defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  
  @type weekday ::
    :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule ::
    :first | :second | :third 
    | :fourth | :last | :teenth

  @day_numbers %{
    :monday     => 1,
    :tuesday    => 2,
    :wednesday  => 3,
    :thursday   => 4,
    :friday     => 5,
    :saturday   => 6,
    :sunday     => 7
  }

  @schedule_index %{
    :first      => 0,
    :second     => 1,
    :third      => 2,
    :fourth     => 3,
    :last       => -1,
    :teenth     => 0
  }

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    day = day_num_range(year, month, schedule)
      |> all_weekday_in_range(year, month, @day_numbers[weekday])
      |> schedule_weekday(@schedule_index[schedule])
    {year, month, day}
  end

  defp day_num_range(_y, _m, :teenth), do: 13..19
  defp day_num_range(year, month, _s) do
    1 .. :calendar.last_day_of_the_month(year, month)
  end

  defp all_weekday_in_range(day_num_range, year, month, weekday_num) do
    Enum.filter day_num_range, fn(day_num) ->
      :calendar.day_of_the_week(year, month, day_num) == weekday_num
    end
  end

  defp schedule_weekday(list_of_weekday, schedule_index) do
    Enum.at(list_of_weekday, schedule_index)
  end

end
