defmodule TableSupervisorSeven do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [

      # Add start and end values to GenServer start

    ]
    opts = [strategy: :one_for_one, name: TableServerSeven.Supervisor]

    supervise(children, opts)
  end
end
