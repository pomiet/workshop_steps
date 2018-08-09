defmodule TableServerTwo do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link(_) do
    # insert start_link call here
  end

  def init(args) do
    {:ok, args}
  end

  def ping() do
    # insert callback here
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  def handle_call(:ping, _from, []) do
    {:reply, {:ok}, []}
  end
end
