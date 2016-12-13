defmodule Kern do
  def ok!({:ok, data}), do: data
  def ok!({other, _}), do: raise "Non-ok code: #{other}"
end
