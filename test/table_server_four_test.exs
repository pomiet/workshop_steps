defmodule TableServerFourTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = TableServerFour.start_link(10)
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "call ping/pong through GenServer function " do
    assert {:ok, 10} == TableServerFour.ping()
    assert {:ok, 11} == TableServerFour.pong()
    assert {:ok, 12} == TableServerFour.ping()
    assert {:ok, 13} == TableServerFour.pong()
  end
end
