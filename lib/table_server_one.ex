defmodule TableServerOne do
  use GenServer

  def init(args) do
    # init
  end

  def handle_call(:ping, _from, []) do
    # handle call and setup for next call
  end
end
