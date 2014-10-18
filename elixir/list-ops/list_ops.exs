defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  # 
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.
 
  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)
  defp count([], acc), do: acc
  defp count([_|t], acc), do: count(t, acc + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], l), do: l
  defp reverse([h|t], l), do: reverse(t, [h|l])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, f, [])
  defp map([], _, l), do: reverse(l)
  defp map([h|t], f, l), do: map(t, f, [f.(h)|l])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, f, [])
  defp filter([], _, l), do: reverse(l)
  defp filter([h|t], f, l) do
    case f.(h) do
      true -> filter(t, f, [h|l])
      _ -> filter(t, f, l)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(reverse(a), b, &([&1|&2]))
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(ll, [], &reduce(&1, &2, fn(e, acc)-> [e|acc] end))
     |> reverse
  end
end

