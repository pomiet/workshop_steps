defmodule TableServerSix do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link(start_number, server_name) do
    # use a function to get the global server name
  end

  def init(start_number) do
    {:ok, start_number}
  end

  def stop(server_name) do
    # use a function to get the global server name
  end

  def ping(server_name) do
    # use a function to try to call the GenServer
  end

  def pong(server_name) do
    # use a function to try to call the GenServer
  end

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

  defp global_server_name(server_name) do
    {:global, {:servername, server_name}}
  end

  defp try_call(server_name, message) do
    # use GenServer.whereis to find the global server name
    # if the server isn't found, return an error
  end
end
