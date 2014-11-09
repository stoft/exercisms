defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth 
  				| :mars | :jupiter
                | :saturn | :neptune | :uranus

  @earth_orbital_period_seconds 31557600

  @orbital_periods_in_earth_years %{
      :mercury => 0.2408467,
      :venus   => 0.61519726,
      :mars    => 1.8808158,
      :jupiter => 11.862615,
      :saturn  => 29.447498,
      :neptune => 164.79132,
      :uranus  => 84.016846,
      :earth   => 1.0 }

  @doc """
  Return the number of years a person that has 
  lived for 'seconds' seconds is aged on 'planet'. 
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
  	seconds / @earth_orbital_period_seconds /
      @orbital_periods_in_earth_years[planet]
  end
end
