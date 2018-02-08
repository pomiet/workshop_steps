defmodule TableServerOne do
  use GenServer

  def init(args) do
    {:ok, args}
  end
  
  def handle_call(:ping, _from, []) do
    {:reply, {:ok}, []}
  end
end
