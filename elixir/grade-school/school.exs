defmodule School do
	@moduledoc """
	Simulate students in a school.

	Each student is in a grade.
	"""

	@doc """
	Add a student to a particular grade in school.
	"""
	@spec add(Dict.t, string, pos_integer) :: Dict.t
	def add(db, name, grade) do
		Dict.update(db, grade, [name], &([name|&1]))
	end

	@doc """
	Return the names of the students in a particular grade.
	"""
	@spec grade(Dict.t, pos_integer) :: [String]
	def grade(db, grade) do
		names = Dict.get(db, grade)
		if (names != nil) do
			Enum.sort(names)
		else
			[]
		end
	end

	@doc """
	Sorts the school by grade and name.
	"""
	@spec sort(Dict) :: Dict.t
	def sort(db) do
		Enum.sort(db, fn({k,v},{k2,v2}) -> k <= k2 end )
	end
end
