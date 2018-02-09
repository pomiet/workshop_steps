defmodule TableSupervisorFive do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      %{
         id: "5021M",
         start: {TableServerFive, :start_link, [0, "5021M"]}
       },
      %{
         id: "5122M",
         start: {TableServerFive, :start_link, [1000000, "5122M"]}
       },
      %{
         id: "5223M",
         start: {TableServerFive, :start_link, [2000000, "5223M"]}
       },
      %{
         id: "5324M",
         start: {TableServerFive, :start_link, [3000000, "5324M"]}
       },
      %{
         id: "5425M",
         start: {TableServerFive, :start_link, [4000000, "5425M"]}
       },
      %{
         id: "5526M",
         start: {TableServerFive, :start_link, [5000000, "5526M"]}
       },
      %{
         id: "5627M",
         start: {TableServerFive, :start_link, [6000000, "5627M"]}
       },
      %{
         id: "5728M",
         start: {TableServerFive, :start_link, [7000000, "5728M"]}
       },
      %{
         id: "5829M",
         start: {TableServerFive, :start_link, [8000000, "5829M"]}
       },
      %{
         id: "5921B",
         start: {TableServerFive, :start_link, [9000000, "5921B"]}
       }
    ]

    # Now we start the supervisor with the children and a strategy
    Supervisor.init(children, strategy: :one_for_one)
  end
end
