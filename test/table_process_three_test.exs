defmodule TableProcessThreeTest do
  use ExUnit.Case

  test "receive pong from ping, and ping from pong" do
    {ping_pid, pong_pid} = TableProcessThree.start()

    send(ping_pid, {self(), :ping})
    assert_receive({ping_pid, :pong}, 1500)
    refute ping_pid == self()

    send(pong_pid, {self(), :pong})
    assert_receive({pong_pid, :ping}, 1500)
    refute pong_pid == self()
  end
end
