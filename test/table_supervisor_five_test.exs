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

    assert {:ok, 1000000} == TableServerFive.ping("122M")
    assert {:ok, 1000001} == TableServerFive.pong("122M")

    assert {:ok, 2000000} == TableServerFive.ping("223M")
    assert {:ok, 2000001} == TableServerFive.pong("223M")

    assert {:ok, 3000000} == TableServerFive.ping("324M")
    assert {:ok, 3000001} == TableServerFive.pong("324M")

    assert {:ok, 4000000} == TableServerFive.ping("425M")
    assert {:ok, 4000001} == TableServerFive.pong("425M")

    assert {:ok, 5000000} == TableServerFive.ping("526M")
    assert {:ok, 5000001} == TableServerFive.pong("526M")

    assert {:ok, 6000000} == TableServerFive.ping("627M")
    assert {:ok, 6000001} == TableServerFive.pong("627M")

    assert {:ok, 7000000} == TableServerFive.ping("728M")
    assert {:ok, 7000001} == TableServerFive.pong("728M")

    assert {:ok, 8000000} == TableServerFive.ping("829M")
    assert {:ok, 8000001} == TableServerFive.pong("829M")

    assert {:ok, 9000000} == TableServerFive.ping("921B")
    assert {:ok, 9000001} == TableServerFive.pong("921B")

  end
end
