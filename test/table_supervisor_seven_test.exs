defmodule TableSupervisorSevenTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, server_pid} = TableSupervisorSeven.start_link([])
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "supervisor restarts GenServer after it dies", %{server: server_pid} do
    assert {:ok, 0} == TableServerSeven.ping("7021M")
    assert {:ok, 1} == TableServerSeven.pong("7021M")

    TableServerSeven.stop("7021M")
    :timer.sleep 1000

    assert {:ok, 0} == TableServerSeven.ping("7021M")
    assert {:ok, 1} == TableServerSeven.pong("7021M")

    assert {:ok, 1000000} == TableServerSeven.ping("7122M")
    assert {:ok, 1000001} == TableServerSeven.pong("7122M")

    assert {:ok, 2000000} == TableServerSeven.ping("7223M")
    assert {:ok, 2000001} == TableServerSeven.pong("7223M")
  end

  test "supervisor does not have requested GenServer", %{server: server_pid} do
    assert {:error, :invalid_server} == TableServerSeven.ping("INVALID_TEST")
  end
end
