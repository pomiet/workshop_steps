defmodule TableSupervisorSixTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, server_pid} = TableSupervisorSix.start_link([])
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "supervisor restarts GenServer after it dies", %{server: server_pid} do
    assert {:ok, 0} == TableServerSix.ping("6021M")
    assert {:ok, 1} == TableServerSix.pong("6021M")

    TableServerSix.stop("6021M")
    :timer.sleep 1000

    assert {:ok, 0} == TableServerSix.ping("6021M")
    assert {:ok, 1} == TableServerSix.pong("6021M")

    assert {:ok, 1000000} == TableServerSix.ping("6122M")
    assert {:ok, 1000001} == TableServerSix.pong("6122M")

    assert {:ok, 2000000} == TableServerSix.ping("6223M")
    assert {:ok, 2000001} == TableServerSix.pong("6223M")
  end

  test "supervisor does not have requested GenServer", %{server: server_pid} do
    assert {:error, :invalid_server} == TableServerSix.ping("INVALID_TEST")
  end
end
