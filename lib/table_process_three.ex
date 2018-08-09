defmodule TableProcessThree do
  def ping do
    receive do
      # Receive a ping, send a pong
    end

    ping()
  end

  def pong do
    # Receive a pong, send a ping
  end

  def start do
    # spawn two processes and return both process ids
    spawn(__MODULE__, :ping, [])
  end
end
