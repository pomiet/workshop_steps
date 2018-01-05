defmodule TableSupervisorSevenTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, server_pid} = TableSupervisorSeven.start_link([])
    {:ok, server: server_pid}
  end

  test "supervisor restarts GenServer after it dies" do
    assert {:ok, 0} == TableServerSeven.ping("7021M")
    assert {:ok, 1} == TableServerSeven.pong("7021M")
    assert {:ok, 1000000} == TableServerSeven.ping("7122M")

    TableServerSeven.stop("7021M")
    :timer.sleep 1000

    assert {:ok, 0} == TableServerSeven.ping("7021M")
    assert {:ok, 1} == TableServerSeven.pong("7021M")
    assert {:ok, 1000001} == TableServerSeven.pong("7122M")
  end

end
