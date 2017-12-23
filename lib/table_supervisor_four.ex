defmodule TableSupervisorFour do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      worker(TableServerFour, [0])
    ]
    opts = [strategy: :one_for_one, name: TableServerFour.Supervisor]

    supervise(children, opts)
  end
end
