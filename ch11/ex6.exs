defmodule Fun do
  def capitalize_sentences(text) do
    String.split(text, ~r{\.\s+}, trim: true)
    |> Enum.map(fn st -> String.capitalize(st) end )
    |> Enum.join(". ")
  end
end



