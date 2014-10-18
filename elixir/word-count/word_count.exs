defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map() 
  def count(sentence) do
  	sentence |> parse_sentence |> add_to_map %{}
  end

  defp parse_sentence(sentence) do
  	sentence |> String.downcase |> String.split ~r/[ ,!&@$%^_:]/, trim: true
  end

  defp add_to_map([], map), do: map
  defp add_to_map([word|tail], map) do
  	count = Dict.get(map, word)
  	case count do
  		nil ->
  			add_to_map(tail, Dict.put(map, word, 1))
  		_ ->
  			add_to_map(tail, Dict.put(map, word, count + 1))
  	end
  end
end
