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
      worker(TableServerFive, [2000000, "223M"], [id: "223M"]),
      worker(TableServerFive, [3000000, "324M"], [id: "324M"]),
      worker(TableServerFive, [4000000, "425M"], [id: "425M"]),
      worker(TableServerFive, [5000000, "526M"], [id: "526M"]),
      worker(TableServerFive, [6000000, "627M"], [id: "627M"]),
      worker(TableServerFive, [7000000, "728M"], [id: "728M"]),
      worker(TableServerFive, [8000000, "829M"], [id: "829M"]),
      worker(TableServerFive, [9000000, "921B"], [id: "921B"])
    ]
    opts = [strategy: :one_for_one, name: TableServerFive.Supervisor]

    supervise(children, opts)
  end
end
