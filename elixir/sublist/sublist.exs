defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      equals?(a, b)   -> :equal
      contains?(b, a) -> :sublist
      contains?(a, b) -> :superlist
      true            -> :unequal
    end
  end
  
  defp equals?(a, b), do: a === b

  defp contains?(a, b) when length(a) < length(b), do: false
  defp contains?(a, b) do
    sublist_of_a = Enum.take(a, length(b))
    equals?(sublist_of_a, b) or contains?(tl(a), b)
  end
end