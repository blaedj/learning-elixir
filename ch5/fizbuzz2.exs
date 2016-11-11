fizzbuzz = fn
  {0, 0, _} -> "FizzBuzz"
  {0, _, _} -> "Fizz"
  {_, 0, _} -> "Buzz"
  {_, _, t} -> "#{t}"
end
fz = fn
  n -> fizzbuzz.({rem(n, 3), rem(n, 5), n})
end
IO.puts fz.(10)
IO.puts fz.(11)
IO.puts fz.(12)
IO.puts fz.(13)
IO.puts fz.(14)
IO.puts fz.(15)
IO.puts fz.(16)
