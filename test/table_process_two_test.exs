defmodule TableProcessTwoTest do
  use ExUnit.Case

  test "send a ping, process lives" do
    pid = TableProcessTwo.start()

    assert true == Process.alive?(pid)

    send(pid, :ping)
    :timer.sleep(1000)
    send(pid, :ping)

    assert true == Process.alive?(pid)
  end
end
