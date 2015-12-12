defmodule MyWorker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, [])
  end

  def handle_call(:do_work, _from, state) do
    IO.puts "process #{inspect self} doing work"
    :timer.sleep 1000
    {:reply, "response", state}
  end
end
