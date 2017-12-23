defmodule TableServerTwoTest do
  use ExUnit.Case

  setup do
    {:ok, server_pid} = TableServerTwo.start_link([])
    {:ok, server: server_pid}
  end

  test "call ping through GenServer function " do
    assert {:ok} == TableServerTwo.ping()
  end
end
