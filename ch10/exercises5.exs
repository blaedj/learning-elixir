defmodule MyEnum do
  def all?([], _func), do: false

  def all?([head | []], func) do
    func.(head)
  end
  
  def all?([head | tail], func) do
    if(func.(head),  do: all?(tail, func), else: false)
  end
  def each([], _func),  do: nil

  def each([ head | tail], func) do
    func.(head)
    each(tail, func)
  end
  def filter(list, func), do: _filter(list, func, [])

  defp _filter([], _func, matches) do
    matches
  end
  defp _filter([ head | tail], func, []) do
    if func.(head) do
      _filter(tail, func, [head])
    else
      _filter(tail, func, [])
    end
  end 
  defp _filter([ head | tail], func, matches) do
    if func.(head) do
      _filter(tail, func, [ matches | head ]) 
    else 
    _filter(tail, func, matches)
    end
  end

  def split([], _count), do: []

  def split([head | tail], count) do
    if (length([head]) == count) do
      [[head] | [tail]]
    else

    end
  end
end

defmodule Test do
  def assert(result, expected, _msg) when result == expected do
    IO.write IO.ANSI.format([:green, "."], true)
  end
  def assert(result, _expected, msg) do
    IO.write IO.ANSI.format([:red, "X - #{msg}, result: #{inspect(result)}"], true)
  end
end

defmodule MyEnum.Test.All do
  def false_for_empty_test do
    result = MyEnum.all?([], fn -> true end)
    Test.assert(result, false, "returns false for empty")
  end
  def true_for_single_element_test do
    result = MyEnum.all?([1], fn n -> n > 0 end)
    Test.assert(result, true, "true if the only element satisfies predicate")
  end
  def true_for_2_element_test do
    result = MyEnum.all?([1, 2], fn n -> n > 0 end)
    Test.assert(result, true, "true if all elements satisfy predicate")
  end
  def true_for_multiple_element_test do
    result = MyEnum.all?([1, 2, 4, 5], fn n -> n > 0 end)
    Test.assert(result, true, "true if all elements satisfy predicate")
  end
  def false_for_single_element_test do
    result = MyEnum.all?([-1], fn n -> n > 0 end)
    Test.assert(result, false, "false if only element fails predicate")
  end
  def false_for_2_element_test do
    result = MyEnum.all?([2,-1], fn n -> n > 0 end)
    Test.assert(result, false, "false if second element fails predicate")
  end
end

defmodule MyEnum.Test.Split do  
  def two_1_element_lists_for_2_element_list do
    result = MyEnum.split([1, 2], 1)
    Test.assert(result, [[1], [2]], "Splits a 2 element list")
  end
  def empty_list_for_empty_list do
    result = MyEnum.split([], 3)
    Test.assert(result, [], "Empty if empty list passed in")
  end
  def correctly_splits_3_element_list do
    result = MyEnum.split([1,2,3], 2)
    Test.assert(result, [[1, 2], [3]], "Splits on the count passed in")
  end
end

IO.puts IO.ANSI.format([:blue, "---- MyEnum.all?/2 ----"], true)
MyEnum.Test.All.false_for_empty_test
MyEnum.Test.All.true_for_single_element_test
MyEnum.Test.All.true_for_2_element_test
MyEnum.Test.All.true_for_multiple_element_test
MyEnum.Test.All.false_for_single_element_test
MyEnum.Test.All.false_for_2_element_test
IO.puts IO.ANSI.format([:blue, "\n---- MyEnum.split/2 ----"], true)
MyEnum.Test.Split.empty_list_for_empty_list
MyEnum.Test.Split.two_1_element_lists_for_2_element_list
MyEnum.Test.Split.correctly_splits_3_element_list
