defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"]}, "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map() 
  def transform(input) do
    Enum.reduce input, Map.new, &invert/2
  end

  defp invert({key, values}, map) do
    Enum.reduce values, map, fn(value, map) ->
      convert_value_to_key(map, value, key)
    end
  end

  defp convert_value_to_key(map, value, old_key) do
    Dict.put map, normalize(value), old_key
  end

  defp normalize(text) do
    text |> String.downcase
  end
end
