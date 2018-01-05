defmodule TableProcessTwo do
  def ping do
    receive do
      :ping -> IO.puts('received ping')
    end
    ping()
  end

  def start do
    spawn(__MODULE__, :ping, [])
  end
end
