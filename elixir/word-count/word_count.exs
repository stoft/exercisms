defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map() 
  def count(sentence) do
  	sentence |> String.downcase |> split |> map
  end

  defp split(sentence) do
    # everything but letters + digits + dash, unicode
  	String.split(sentence, ~r/[^\pL\d-]/u, trim: true)
  end

  defp map(list) do
    Enum.reduce(list, %{}, 
      &Map.update(&2, &1, 1, fn(i) -> i + 1 end))
  end
end
