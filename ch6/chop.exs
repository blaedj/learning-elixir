defmodule Chop do
  def guess(answer, range) do
    min..max = range
    guess(answer, range, div(min + max,2))
  end

  def guess(answer, range, guess), when guess == answer, do: IO.inspect guess

  def guess(answer, range, guess) when guess < answer do
    IO.puts "Is it #{guess}?"
    min..max = (guess + 1)..Enum.max(range)
    guess(answer, min..max, div(min + max, 2))
  end

  def guess(answer, range, guess) when guess > answer do
    IO.puts "Is it #{guess}?"
    min..max = Enum.min(range)..(guess - 1)
    guess(answer, min..max, div(min + max, 2))
  end
end
