people = [
  %{ name: "Grumpy", height: 1.24 },
  %{ name: "Dopey",  height: 1.3 },
  %{ name: "Dave",   height: 1.88 },
  %{ name: "Shaq", height: 2.16 },
  %{ name: "Sneezy", height: 1.22 }
]

IO.inspect( for person = %{ height: height } <- people, height > 1.25, do: person)
