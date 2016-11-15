defmodule Mod do
  @author "Blaed J"
  def get_author do
    @author
  end
end

IO.puts "Mod was written by #{Mod.get_author}"
