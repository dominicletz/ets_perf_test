defmodule EtsPerfTest do
  def prepare do
    :ets.new(__MODULE__, [:named_table])

    for x <- 1..10000 do
      :ets.insert(__MODULE__, {x, x})
    end

    :ok
  end

  def read(iterations) do
    {micros, :ok} = :timer.tc(&read_loop/1, [iterations])
    iterations / (micros / 100_000)
  end

  defp read_loop(0) do
    :ok
  end

  defp read_loop(iterations) do
    :ets.lookup(__MODULE__, rem(iterations, 10000))
    read_loop(iterations - 1)
  end
end
