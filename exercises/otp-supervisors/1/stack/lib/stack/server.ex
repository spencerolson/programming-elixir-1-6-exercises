defmodule Stack.Server do
  use GenServer

  alias Stack.Impl

  def start_link(_), do: GenServer.start_link(__MODULE__, nil, name: __MODULE__, debug: [:trace])

  @impl true
  def init(_) do
    Process.flag(:trap_exit, true)
    IO.puts("Starting server with #{inspect(Stash.get())} from the stash.")
    {:ok, Stash.get()}
  end

  @impl true
  def handle_call(:pop, _client_pid, state) do
    {:ok, response, new_state} = Impl.pop(state)
    {:reply, response, new_state}
  end

  @impl true
  def handle_cast({:push, elem}, state) do
    {:ok, _response, new_state} = Impl.push(elem, state)
    {:noreply, new_state}
  end

  @impl true
  def terminate(reason, stack) do
    IO.puts("Terminating (reason: #{inspect(reason)})! saving #{inspect(stack)} in the stash.")
    Stash.set(stack)
  end
end
