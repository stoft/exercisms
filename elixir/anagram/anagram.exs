defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
	Enum.filter(candidates, 
		&match_item(String.downcase(base), 
			String.downcase(&1)))  
  end
  defp match_item(base, candidate) when base === candidate, do: false
  defp match_item(base, candidate) when length(base) != length(candidate), do: false
  defp match_item(base, candidate) do
  	Enum.sort(String.to_char_list(base)) === 
  		Enum.sort(String.to_char_list(candidate))
  end
end
