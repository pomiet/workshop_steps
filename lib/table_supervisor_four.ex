defmodule TableSupervisorFour do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    # Initialize children here

    # Now we start the supervisor with the children and a strategy
  end
end
