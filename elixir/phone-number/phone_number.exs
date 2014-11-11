defmodule Phone do
  @standard_num_length 10
  
  @invalid_num "0000000000"

  @us_ca_country_code "1"

  @area_code_length 3
  @exchange_length 3
  @subscriber_length 4
  
  @clean_re ~r/[\D]/

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw |> sanitize |> validate
  end

  defp sanitize(phone_number) do
    String.replace(phone_number, @clean_re, "")
  end

  defp validate(str) do
    str
    |> valid_length_and_cc?
    |> if do
      str |> String.split_at(-@standard_num_length) |> elem 1
    else
      @invalid_num
    end
  end

  defp valid_length_and_cc?(<<_::binary-@standard_num_length>>), do: true
  defp valid_length_and_cc?(<<@us_ca_country_code,
    _::binary-@standard_num_length>>),
  do: true

  defp valid_length_and_cc?(_), do: false

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw |> number |> parse_number |> elem 0
  end

  defp parse_number(<<area_code::binary-@area_code_length,
    exchange::binary-@exchange_length,
    subscriber::binary-@subscriber_length>>)
  do
    { area_code, exchange, subscriber}
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    { area_code, exchange, subscriber} = number(raw) |> parse_number
    "(#{area_code}) #{exchange}-#{subscriber}"
  end
end
