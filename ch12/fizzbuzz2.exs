defmodule FizzBuzz do
  def upto(n) when n > 0, do: _downto(n, [])
  defp _downto(0, result), do: result
  defp _downto(current, result) do
    next_result =
      case {rem(current, 3), rem(current, 5)} do
	{0, 0} ->
	  "FizzBuzz"
	{0, _} ->
	  "Fizz"
	{_, 0} ->
	  "Buzz"
	{_, _} ->
	  current
      end
    _downto(current - 1, [next_result | result])
  end
end

FizzBuzz.upto(100)
