defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    normalized_base = String.downcase(base) |> normalize
    Enum.filter(candidates, 
		  &match_item(String.downcase(base), 
			 String.downcase(&1),
       normalized_base))  
  end

  defp match_item(same, same, _), do: false
  defp match_item(base, candidate, _) when length(base) != length(candidate), do: false
  defp match_item(_, candidate, normalized_base) do
  	normalized_base === normalize(candidate)
  end

  defp normalize(string) do
    string |> String.to_char_list |> Enum.sort
  end
end
