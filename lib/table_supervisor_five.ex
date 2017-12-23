defmodule TableSupervisorFive do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      worker(TableServerFive, [0])
    ]
    opts = [strategy: :one_for_one, name: TableServerFive.Supervisor]

    supervise(children, opts)
  end
end
