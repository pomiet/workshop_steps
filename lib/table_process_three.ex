defmodule TableProcessThree do
  def ping do
    receive do
      {from, :ping} ->
        IO.puts 'received ping, send pong'
        send from, {self(), :pong}
    end
    ping()
  end

  def pong do
    receive do
      {from_pid, :pong} ->
        IO.puts 'received pong, send ping'
        send from_pid, {self(), :ping}
    end
    pong()
  end

  def start do
    ping_pid = spawn(__MODULE__, :ping, [])
    pong_pid = spawn(__MODULE__, :pong, [])
    {ping_pid, pong_pid}
  end
end
