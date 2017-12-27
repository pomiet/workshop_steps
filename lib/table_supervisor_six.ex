defmodule TableSupervisorSix do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      worker(TableServerSix, [0, "6021M"], [id: "6021M"]),
      worker(TableServerSix, [1000000, "6122M"], [id: "6122M"]),
      worker(TableServerSix, [2000000, "6223M"], [id: "6223M"]),
    ]
    opts = [strategy: :one_for_one, name: TableServerSix.Supervisor]

    supervise(children, opts)
  end
end
