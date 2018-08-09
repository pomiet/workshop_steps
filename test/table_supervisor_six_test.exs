defmodule TableSupervisorSixTest do
  use ExUnit.Case, async: true

  setup_all do
    {:ok, server_pid} = TableSupervisorSix.start_link([])
    :sys.statistics(server_pid, true)
    :sys.trace(server_pid, true)

    {:ok, server: server_pid}
  end

  test "supervisor restarts GenServer after it dies" do
    assert {:ok, 0} == TableServerSix.ping(:six021M)
    assert {:ok, 1} == TableServerSix.pong(:six021M)

    TableServerSix.stop(:six021M)
    :timer.sleep(1000)

    assert {:ok, 0} == TableServerSix.ping(:six021M)
    assert {:ok, 1} == TableServerSix.pong(:six021M)
  end

  test "supervisor does not have requested GenServer" do
    assert {:error, :invalid_server} == TableServerSix.ping("INVALID_TEST")
  end
end
