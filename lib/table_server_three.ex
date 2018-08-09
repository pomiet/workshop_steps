defmodule TableServerThree do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link(_) do
    # start link with initial value
  end

  def init(args) do
    {:ok, args}
  end

  def ping() do
    GenServer.call(__MODULE__, :ping)
  end

  # Be sure to setup a pong()

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  def handle_call(:ping, _from, current_number) do
    {:reply, {:ok, current_number}, current_number}
  end

  # pong handler goes here
end
