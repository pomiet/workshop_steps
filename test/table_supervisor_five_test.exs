defmodule TableSupervisorFiveTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, server_pid} = TableSupervisorFive.start_link([])
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "supervisor restarts after exit", %{server: server_pid} do
    assert {:ok, 0} == GenServer.call(TableServerFive, :ping)
    assert {:ok, 1} == GenServer.call(TableServerFive, :pong)
    assert {:ok, 2} == TableServerFive.ping()
    assert {:ok, 3} == TableServerFive.pong()
  end
end
