defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
  	cond do
  		equals?(a, b) -> :equal
  		contains?(b, a) -> :sublist
  		contains?(a, b) -> :superlist
  		true -> :unequal
  	end
  end

  
  def equals?(a, b), do: a === b

  def contains?(a, _) when length(a) == 0, do: true
  def contains?([], _), do: false
  def contains?(a, b) do
  	list = Enum.take(a, length(b))
  	cond do
 		equals?(list, b) -> true
 		true -> contains?(tl(a), b)
 	end
  end

  defp grab_sublist(a, b) do
  	[first|_] = a
  	[last|_] = Enum.reverse(a)
  	list = Enum.drop_while(b, fn(e) -> first != e end)
  	Enum.drop_while(Enum.reverse(list), fn(e) -> last != e end)
  	 |> Enum.reverse
  end
end