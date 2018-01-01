defmodule Table do
  def ping do
    receive do
      :ping -> IO.puts('received ping, send pong')
    end
  end

  def start do
    spawn(__MODULE__, :ping, [])
  end
end
