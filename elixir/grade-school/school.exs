defmodule School do
	@moduledoc """
	Simulate students in a school.

	Each student is in a grade.
	"""

	@doc """
	Add a student to a particular grade in school.
	"""
	@spec add(Dict.t, string, pos_integer) :: Dict.t
	def add(school, name, grade) do
		Dict.update(school, grade, [name], &([name|&1]))
	end

	@doc """
	Return the names of the students in a particular grade.
	"""
	@spec grade(Dict.t, pos_integer) :: [String]
	def grade(school, grade) do
		Dict.get(school, grade, [])
	end

	@doc """
	Sorts the school by grade and name.
	"""
	@spec sort(Dict) :: Dict.t
	def sort(school) do
		Enum.reduce(school, %{}, fn({grade, names}, school) ->
			Dict.put(school, grade, Enum.sort(names)) end)
	end
end
