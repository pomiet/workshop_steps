defmodule TableSupervisorSix do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      %{
         id: "6021M",
         start: {TableServerSix, :start_link, [0, "6021M"]}
       },
      %{
         id: "6122M",
         start: {TableServerSix, :start_link, [1000000, "6122M"]}
       },
      %{
         id: "6223M",
         start: {TableServerSix, :start_link, [2000000, "6223M"]}
       }
    ]

    # Now we start the supervisor with the children and a strategy
    Supervisor.init(children, strategy: :one_for_one)
  end
end
