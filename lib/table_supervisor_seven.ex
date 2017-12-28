defmodule TableSupervisorSeven do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      worker(TableServerSeven, [[0, 999999], "7021M"], [id: "7021M"]),
      worker(TableServerSeven, [[1000000, 999999], "7122M"], [id: "7122M"]),
      worker(TableServerSeven, [[2000000, 999999], "7223M"], [id: "7223M"]),
    ]
    opts = [strategy: :one_for_one, name: TableServerSeven.Supervisor]

    supervise(children, opts)
  end
end
