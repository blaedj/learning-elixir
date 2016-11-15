fun = fn num ->
  str = :io_lib.format("~.2f", [num])
  [str | _] = Regex.replace(~r{\.}, str, "[.]]")
  str
end
