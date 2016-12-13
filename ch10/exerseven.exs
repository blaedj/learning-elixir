defmodule MyList do
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


defmodule Primes do

  def upto(n) do
    for x <- MyList.span(2, n), is(x), do: x
  end

  # i <- Enum.reverse(MyList.span(2,x))
  def is(x) do
    for i <- MyList.span(2,x), do: is_prime(x, i)
  end
  
  def is_prime(x, i) when rem(x, i) == 0, do: false
  def is_prime(x, i) when i*i > x, do: true
  def is_prime(x, i) when x > i, do: is_prime(x, i + 1)

end
