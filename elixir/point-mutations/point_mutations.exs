defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

	iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
	4
	"""
	@spec hamming_distance([char], [char]) :: non_neg_integer
	def hamming_distance(strand1, strand2) do
		if length(strand1) == length(strand2) do
			match(strand1, strand2, 0)
		end
	end

	defp match([],[], acc), do: acc
	defp match([head|tail1],[head|tail2], acc), do: match(tail1, tail2, acc)
	defp match([_|tail1],[_|tail2], acc), do: match(tail1, tail2, acc + 1)
end
