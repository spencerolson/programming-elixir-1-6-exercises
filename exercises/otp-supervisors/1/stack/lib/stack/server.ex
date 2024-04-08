defmodule Stack.Server do
  use GenServer

  alias Stack.Stash

  # API Methods
  def start_link(_), do: GenServer.start_link(__MODULE__, nil, name: __MODULE__, debug: [:trace])

  def pop, do: GenServer.call(__MODULE__, :pop)

  def push(elem), do: GenServer.cast(__MODULE__, {:push, elem})

  def crash, do: GenServer.stop(__MODULE__)

  # GenServer Callbacks
  @impl true
  def init(_) do
    Process.flag(:trap_exit, true)
    IO.puts("Starting server with #{inspect(Stash.get())} from the stash.")
    {:ok, Stash.get()}
  end

  @impl true
  def handle_call(:pop, _client_pid, [first | rest]) do
    {:reply, first, rest}
  end

  @impl true
  def handle_cast({:push, elem}, stack) do
    {:noreply, [elem | stack]}
  end

  @impl true
  def terminate(reason, stack) do
    IO.puts("Terminating (reason: #{inspect(reason)})! saving #{inspect(stack)} in the stash.")
    Stash.set(stack)
  end
end
