defmodule TableSupervisorSevenTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, server_pid} = TableSupervisorSeven.start_link([])
    {:ok, server: server_pid}
  end

  test "supervisor restarts GenServer after it dies" do
    assert {:ok, 0} == TableServerSeven.ping(:seven021M)
    assert {:ok, 1} == TableServerSeven.pong(:seven021M)

    assert {:ok, 1_000_000} == TableServerSeven.ping(:seven122M)

    TableServerSeven.stop(:seven021M)
    :timer.sleep(1000)

    assert {:ok, 0} == TableServerSeven.ping(:seven021M)
    assert {:ok, 1} == TableServerSeven.pong(:seven021M)
    assert {:ok, 1_000_001} == TableServerSeven.pong(:seven122M)
  end
end
