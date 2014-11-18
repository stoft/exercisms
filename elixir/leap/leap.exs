defmodule Year do

  @ordered_rules [
    {400, true},
    {100, false},
    {4, true},
    {1, false}
  ]

  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    year
      |> find_matching_rule( @ordered_rules, &divisible_by?/2 )
      |> extract_rule_outcome
  end

  defp divisible_by?(num1, num2), do: rem(num1, num2) == 0

  defp extract_rule_outcome({_rule_value, outcome}), do: outcome

  defp find_matching_rule(number, rules, match_function) do
    Enum.find rules, fn({rule_value, _outcome}) ->
      match_function.(number, rule_value)
    end
  end
end