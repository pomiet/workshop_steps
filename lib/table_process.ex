defmodule TableProcess do
  def ping do
    receive do
      {from, :ping} ->
        IO.puts("ping process reached, going to respond with :pong")
        send(from, {self(), :pong})
    end

    ping()
  end

  def start do
    spawn(__MODULE__, :ping, [])
  end
end
