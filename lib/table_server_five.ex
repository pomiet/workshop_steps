defmodule TableServerFive do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link(start_number) do
    # Call start_link with global server_name
  end

  def init(start_number) do
    {:ok, start_number}
  end

  def ping() do
    # Call global server_name with ping
  end

  def pong() do
    # Call global server_name with pong
  end

  # Add stop function

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  def handle_call(:ping, _from, current_number) do
    {:reply, {:ok, current_number}, current_number + 1}
  end

  def handle_call(:pong, _from, current_number) do
    {:reply, {:ok, current_number}, current_number + 1}
  end
end
