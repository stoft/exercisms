defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    [{400, true}, {100, false}, {4, true}, {1, false}]
    |> Enum.find(fn({n, _b}) -> rem(year, n) == 0 end)
    |> elem 1
  end

end
