defmodule Words do
  # everything but letters + digits + dash, unicode
  @word_boundaries ~r/[^\pL\d-]/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map() 
  def count(sentence) do
  	sentence |> normalize |> split |> count_items
  end

  defp normalize(string) do
    string |> String.downcase
  end

  defp split(sentence) do
  	String.split(sentence, @word_boundaries, trim: true)
  end

  defp count_items(list) do
    Enum.reduce(list, %{}, fn(e, acc) ->
      Map.update(acc, e, 1, &(&1 + 1)) end)
  end
end
