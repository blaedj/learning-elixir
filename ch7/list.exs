defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def max([head | tail]) do
    _max(tail, head)
  end

  defp _max([head | tail], cur) when cur > head do
    _max(tail, cur)
  end

  defp _max([head | tail], cur) when cur <= head do
    _max( tail, head)
  end
  defp _max([], cur), do: cur

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def caesar(list, n) do
    map(list, fn item -> _encode(item, n) end)
  end

  defp _encode(item, n) when (item + n > 122) do
    adder = n - (122 - item)
    96 + adder # need to add on to get to 97 ('a') which is why we start at 96
	       # when wrapping.
  end
  defp _encode(item, n), do: item + n

  def span(from, to) do
    _span(from, to, [])
  end
  defp _span(from, to, accum) when from > to do
    accum
  end
  defp _span(from, to, accum) do
    _span(from, to - 1, [to | accum])
  end
end
