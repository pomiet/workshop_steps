defmodule TableServerThreeTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = TableServerThree.start_link(0)
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "call ping/pong through GenServer function " do
    assert {:ok, 0} == TableServerThree.ping()
    assert {:ok, 0} == TableServerThree.pong()
  end
end
