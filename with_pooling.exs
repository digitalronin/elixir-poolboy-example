defmodule Demo do

  def call(pool) do
    :poolboy.transaction(pool, fn(pid) -> GenServer.call(pid, :do_work) end)
  end

end

{:ok, pool} = :poolboy.start_link([worker_module: MyWorker, size: 2, max_overflow: 0])

tasks = Enum.map(1..10, fn(_) ->
  Task.async(fn -> Demo.call(pool) end)
end)

Enum.each(tasks, &Task.await/1)

