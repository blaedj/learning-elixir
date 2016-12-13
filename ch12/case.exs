case File.open("case.exs") do
  {:ok, file } ->
    IO.puts "FILE:----\n#{IO.read(file, :line)}"
  {:error, reason} ->
    IO.puts "Failed to open file: #{reason}"
end


dave = %{name: "Dave", age: 27}
case dave do
  person = %{age: age} when is_number(age) and age >= 21 ->
    IO.puts "You're cleared to enter the Foo Bar, #{person.name}"
  _ ->
    IO.puts "Sorry, no admission"
end
