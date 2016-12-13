defmodule Fun do
  def center(wordlist) do
    words = Enum.sort( wordlist, &(String.length(&1) <= String.length(&2)))
    longest = Enum.at words, -1
    length = String.length(longest) |> _ensure_even
    IO.puts length
    Enum.each words, fn w ->
      # leading_space = String.length(w) + div(length - String.length(w), 2)
      String.pad_leading(w, String.length(w) + div(length - String.length(w), 2), " ")
      |> String.pad_trailing(length, " ")
      |> IO.puts
    end
  end

  defp _ensure_even(num) when rem(num, 2) != 0, do: num + 1
  defp _ensure_even(num), do: num
end



Fun.center(["cat", "zebra", "elephant"])
