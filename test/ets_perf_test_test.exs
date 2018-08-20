defmodule EtsPerfTestTest do
  use ExUnit.Case
  doctest EtsPerfTest

  test "tests" do
    assert EtsPerfTest.prepare() == :ok
    IO.puts("Single thread lookup req/s: #{inspect(EtsPerfTest.read(100_000_000))}")
  end
end
