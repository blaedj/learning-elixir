defmodule MyList do
  def square([]),             do: []
  def square([ head | tail]), do: [ head*head | square(tail) ]

  def add_1([]), do: []
  def add_1([ head | tail]), do: [ head+1 | add_1(tail) ]

  def map([], _func), do: []
  def map([ head | tail], func), do: [ func.(head) | map(tail, func) ]

  def sum([head | [tail_h, tail_t]]), do: sum([head + tail_h | tail_t])
  # def sum([head | [tail | []]]), do: head + tail
  def sum([head | tail]), do: head + List.first(tail)

  def reduce([], value, _), do: value
  def reduce([head | tail], value, fun) do
    reduce(tail, fun.(head, value), fun)
  end

  def mapsum(list, fun) do
    sum(map(list, fun))
  end
end
