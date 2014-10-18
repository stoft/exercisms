defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

	iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
	4
	"""
	@spec hamming_distance([char], [char]) :: non_neg_integer
	def hamming_distance(strand1, strand2) do
		match(strand1, strand2, 0)
	end

	defp match(l1,l2,_) when length(l1) != length(l2), do: nil 
	defp match([],[], acc), do: acc
	defp match([h1|t1],[h1|t2], acc), do: match(t1, t2, acc)
	defp match([h1|t1],[h2|t2], acc), do: match(t1, t2, acc + 1)
end
