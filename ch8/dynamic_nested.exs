nested = %{
  buttercup: %{
    blossom: %{
      color: 'yellow',
      petals: 6
    },
    season: 'summer'
  },
  daisy: %{
    blossom: %{
      color: 'white',
      petals: 7
    },
    season: 'spring'
  }
}

IO.inspect get_in(nested, [:buttercup])

IO.inspect get_in(nested, [:buttercup, :blossom])

IO.inspect get_in(nested, [:buttercup, :blossom, :color])

IO.inspect put_in(nested, [:daisy, :blossom, :petals], 8)
