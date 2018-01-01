defmodule Table do
  def ping do
    receive do
      {from_pid, :ping} ->
        IO.puts('received ping, send pong')
        :timer.sleep(1000)
        send from_pid, {self(), :pong}
    end
    ping
  end

  def pong do
    receive do
      {from_pid, :pong} ->
        IO.puts('received pong, send ping')
        :timer.sleep(1000)
        send from_pid, {self(), :ping}
    end
    pong
  end

  def start do
    ping_pid = spawn(__MODULE__, :ping, [])
    pong_pid = spawn(__MODULE__, :pong, [])
    {ping_pid, pong_pid}
  end
end
