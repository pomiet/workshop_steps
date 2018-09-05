defmodule TableServerSixTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = TableServerSix.start_link(10, :six021M)
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "call ping/pong through GenServer function " do
    assert {:ok, 10} == TableServerSix.ping(:six021M)
    assert {:ok, 11} == TableServerSix.pong(:six021M)
    assert {:ok, 12} == TableServerSix.ping(:six021M)
    assert {:ok, 13} == TableServerSix.pong(:six021M)
  end
end
