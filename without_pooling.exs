defmodule Demo do

  def call do
    {:ok, pid} = GenServer.start_link(MyWorker, nil)
    GenServer.call(pid, :do_work)
  end

end

tasks = Enum.map(1..10, fn(_) ->
  Task.async(fn -> Demo.call end)
end)

Enum.each(tasks, &Task.await/1)

