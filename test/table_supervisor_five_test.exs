defmodule TableSupervisorFiveTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, server_pid} = TableSupervisorFive.start_link([])
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "supervisor restarts after exit", %{server: server_pid} do
    assert {:ok, 0} == TableServerFive.ping("021M")
    assert {:ok, 1} == TableServerFive.pong("021M")
    assert {:ok, 2} == TableServerFive.ping("021M")
    assert {:ok, 3} == TableServerFive.pong("021M")

    assert {:ok, 1000000} == TableServerFive.ping("122M")
    assert {:ok, 1000001} == TableServerFive.pong("122M")
    assert {:ok, 1000002} == TableServerFive.ping("122M")
    assert {:ok, 1000003} == TableServerFive.pong("122M")

    assert {:ok, 2000000} == TableServerFive.ping("223M")
    assert {:ok, 2000001} == TableServerFive.pong("223M")
    assert {:ok, 2000002} == TableServerFive.ping("223M")
    assert {:ok, 2000003} == TableServerFive.pong("223M")
  end
end
