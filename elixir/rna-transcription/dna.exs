defmodule DNA do
	@nucleotides %{?A => ?U, ?C => ?G, ?G => ?C, ?T => ?A }
  	
  	@doc """
  	Transcribes a character list representing DNA nucleotides to RNA

  	## Examples
	
  	iex> DNA.to_rna('ACTG')
  	'UGAC'
  	"""
  	@spec to_rna([char]) :: [char]
  	def to_rna(dna) do
  		Enum.map(dna, fn(d) ->
  			Dict.get(@nucleotides, d) end)
  	end
end
