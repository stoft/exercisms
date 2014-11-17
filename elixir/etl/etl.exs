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
    Enum.reduce(values, map, fn(val, map) ->
      Dict.put(map, String.downcase(val), key) end )
  end
end
