defmodule MyWorker do
  use GenServer

  def handle_call(:do_work, _from, state) do
    IO.puts "process #{inspect self} doing work"
    :timer.sleep 1000
    {:reply, "response", state}
  end
end
