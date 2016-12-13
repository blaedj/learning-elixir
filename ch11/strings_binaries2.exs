defmodule Fun do
  def anagram?(word1, word2) when word1 == word2, do: true
  def anagram?(word1, word2) do
    first = String.codepoints(word1) |> Enum.sort
    second = String.codepoints(word2) |> Enum.sort
    first == second
  end
  def each(str, func), do: _each(String.next_grapheme(str), func)

  defp _each({:no_grapheme, _}, _), do: []
  defp _each(nil, _), do: []

  defp _each({grapheme, rest}, func) do
    func.(grapheme)
    _each(String.next_grapheme(rest), func)
  end

end
