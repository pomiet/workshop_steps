defmodule TableServerSeven do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link(start_number, server_name) do

    # update initial state with start and end numbers

    GenServer.start_link(__MODULE__, start_number, name: global_server_name(server_name))
  end

  def init(start_number) do

    # update initial state with start and end numbers

    {:ok, start_number}
  end

  def stop(server_name) do
    GenServer.stop(global_server_name(server_name))
  end

  def ping(server_name) do
    try_call(server_name, :ping)
  end

  def pong(server_name) do
    try_call(server_name, :pong)
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #


  # update handle_call with 'when' guard clause to continue incrementing
  def handle_call(:ping, _from, current_number) do

    # update to handle start and end numbers

    {:reply, {:ok, current_number}, current_number+1}
  end


  # ** add **   handle_call with 'when' guard clause to stop incrementing


  # update handle_call with 'when' guard clause to continue incrementing
  def handle_call(:pong, _from, current_number) do

    # update to handle start and end numbers

    {:reply, {:ok, current_number}, current_number+1}
  end


  # ** add **   handle_call with 'when' guard clause to stop incrementing


  defp global_server_name(server_name) do
    {:global, {:servername, server_name}}
  end

  defp try_call(server_name, message) do
    case GenServer.whereis(global_server_name(server_name)) do
      nil ->
        {:error, :invalid_server}
      servername ->
        GenServer.call(servername, message)
    end
  end

end
