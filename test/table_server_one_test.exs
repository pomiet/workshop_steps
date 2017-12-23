defmodule TableServerOneTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = GenServer.start_link(TableServerOne, [])
    {:ok, server: server_pid}
  end

  test "call ping directly with a GenServer", %{server: spid} do
    assert {:ok} == GenServer.call(spid, :ping)
  end
end
