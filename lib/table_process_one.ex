defmodule TableProcessOne do
  def ping do
    receive do
      :ping -> IO.puts("received ping")
    end
  end

  def start do
    spawn(__MODULE__, :ping, [])
  end
end
