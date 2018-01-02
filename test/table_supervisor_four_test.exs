defmodule TableSupervisorFourTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = TableSupervisorFour.start_link([])
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "supervisor knows about GenServer", %{server: server_pid} do
    assert {:ok, 0} == GenServer.call(TableServerFour, :ping)
    assert {:ok, 1} == GenServer.call(TableServerFour, :pong)
    assert {:ok, 2} == TableServerFour.ping()
    assert {:ok, 3} == TableServerFour.pong()
  end
end
