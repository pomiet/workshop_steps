defmodule TableSupervisorFive do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      worker(TableServerFive, [0, "021M"], [id: "021M"]),
      worker(TableServerFive, [1000000, "122M"], [id: "122M"]),
      worker(TableServerFive, [2000000, "223M"], [id: "223M"])
    ]
    opts = [strategy: :one_for_one, name: TableServerFive.Supervisor]

    supervise(children, opts)
  end
end
