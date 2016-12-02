defmodule Countdown do
  def sleep(seconds) do
    receive do
    after seconds*1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn -> # the number of seconds to the start of the next minute
	{ _h, _min, seconds } = :erlang.time
	60 - seconds - 1
      end,
      fn # wait for the next second, the return its countdown
	0 -> { :halt, 0 }
	count ->
	  sleep(1)
	  { [inspect(count)], count - 1 }
      end,
      fn _ -> nil end # nothing to deallocate, no-op cleanup phase.
    )
  end
end
