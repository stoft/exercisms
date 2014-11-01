defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"]}, "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map() 
  def transform(input) do
	#input
	list = Dict.to_list(input)
  	map = Enum.reduce(list, %{}, fn({k, v}, acc) -> 
  		Enum.reduce(v, acc, &(Map.put(&1, v, k))) end)
  	IO.inspect map
  end
end
