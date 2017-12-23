defmodule TableServerThree do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link(start_number) do
    GenServer.start_link(__MODULE__, start_number, name: __MODULE__)
  end

  def init(start_number) do
    {:ok, start_number}
  end

  def ping() do
    GenServer.call(__MODULE__, :ping)
  end

  def pong() do
    GenServer.call(__MODULE__, :pong)
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  def handle_call(:ping, _from, current_number) do
    {:reply, {:ok, current_number}, current_number}
  end

  def handle_call(:pong, _from, current_number) do
    {:reply, {:ok, current_number}, current_number}
  end

end
