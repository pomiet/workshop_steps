defmodule TableServerZeroTest do
  use ExUnit.Case

  test "receive pong from ping" do
    to_pid = TableServerZero.start()
    send(to_pid, {self(), :ping})

    assert_receive({to_spid, :pong})
    refute to_pid == self()
  end
end
