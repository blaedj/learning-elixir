cast = [
  %{
    character: "Buttercup",
    actor:    { "Robin", "Wright"},
    role:     "princess"
  },
  %{
    character: "Westly",
    actor:    { "Cary", "Elwes"},
    role:     "farm boy"
  }
]
get_in(cast, [Access.all(), :actor, Access.elem(1)])

get_and_update_in(cast, [Access.all(), :actor, Access.elem(0)],
  fn (val)-> {val, String.reverse(val)} end)
