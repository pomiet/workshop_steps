defmodule TableServerOne do
  use GenServer

  def handle_call(:ping, _from, []) do
    {:reply, {:ok}, []}
  end
end
