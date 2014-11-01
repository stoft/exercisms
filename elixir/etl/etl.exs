defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"]}, "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map() 
  def transform(input) do
	list = Dict.to_list(input)
  Enum.reduce(list, %{}, fn({k, v}, acc) ->
      invert(v, acc, k) end)
  end

  defp invert(values, acc, key) do
    Enum.reduce(values, acc, fn(val, acc) ->
      Dict.put(acc, normalize(val), key) end )
  end

  defp normalize(str) do
    String.downcase(str)
  end
end
