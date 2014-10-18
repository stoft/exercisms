defmodule Teenager do
  def hey(input) do
    cond do
    	silent?(input) ->
    		"Fine. Be that way!"
    	screaming?(input) ->
    		"Whoa, chill out!"
    	question?(input) ->
    		"Sure."
    	true ->
    		"Whatever."
    end
  end

  defp silent?(input) do
  	String.strip(input) == ""
  end

  defp question?(input) do
  	String.last(input) == "?"
  end

  defp screaming?(input) do
  	only_upcase(input) and has_letters(input)
  end

  defp has_letters(input) do
  	String.match?(input, ~r/[\p{L}]/)
  end

  defp only_upcase(input) do
  	String.upcase(input) == input
  end
end
