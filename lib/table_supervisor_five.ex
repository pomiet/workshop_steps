defmodule TableSupervisorFive do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      # add children
    ]

    # Now we start the supervisor with the children and a strategy
    Supervisor.init(children, strategy: :one_for_one)
  end
end
