defmodule TableSupervisorSeven do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      %{
         id: "7021M",
         start: {TableServerSeven, :start_link, [[0, 999999], "7021M"]}
       },
      %{
         id: "7122M",
         start: {TableServerSeven, :start_link, [[1000000, 1999999], "7122M"]}
       },
      %{
         id: "7223M",
         start: {TableServerSeven, :start_link, [[2000000, 2999999], "7223M"]}
       }
    ]

    # Now we start the supervisor with the children and a strategy
    Supervisor.init(children, strategy: :one_for_one)
  end
end
