defmodule TableSupervisorFiveTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = TableSupervisorFive.start_link([])
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "supervisor restarts GenServer after it dies" do
    assert {:ok, 0} == TableServerFive.ping(:five021M)
    assert {:ok, 1} == TableServerFive.pong(:five021M)

    TableServerFive.stop(:five021M)
    :timer.sleep(1000)

    assert {:ok, 0} == TableServerFive.ping(:five021M)
    assert {:ok, 1} == TableServerFive.pong(:five021M)
  end
end
