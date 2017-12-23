defmodule TableServerFiveTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = TableServerFive.start_link(10)
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "call ping/pong through GenServer function " do
    assert {:ok, 10} == TableServerFive.ping()
    assert {:ok, 11} == TableServerFive.pong()
    assert {:ok, 12} == TableServerFive.ping()
    assert {:ok, 13} == TableServerFive.pong()
  end
end
