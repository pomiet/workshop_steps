defmodule TableSupervisorSeven do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      # introduce two child processes
      # 1. count from 0 to 1 million
      # 2. count from 1 million to 2 million
    ]

    # Now we start the supervisor with the children and a strategy
    Supervisor.init(children, strategy: :one_for_one)
  end
end
