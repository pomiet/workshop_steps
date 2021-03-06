defmodule TableServerSevenTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = TableServerSeven.start_link([10, 12], :seven021M)
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "call ping/pong through GenServer function " do
    assert {:ok, 10} == TableServerSeven.ping(:seven021M)
    assert {:ok, 11} == TableServerSeven.pong(:seven021M)
    assert {:ok, 12} == TableServerSeven.ping(:seven021M)
    # Note doesn't exceed max
    assert {:ok, 12} == TableServerSeven.pong(:seven021M)
  end
end
