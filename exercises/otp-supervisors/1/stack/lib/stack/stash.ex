defmodule Stack.Stash do
  use GenServer

  # API Methods
  def start_link(stack), do: GenServer.start_link(__MODULE__, stack, name: __MODULE__)

  def get, do: GenServer.call(__MODULE__, :get)

  def set(stack), do: GenServer.cast(__MODULE__, {:set, stack})

  # GenServer Callbacks
  @impl true
  def init(stack), do: {:ok, stack}

  @impl true
  def handle_call(:get, _from, stack), do: {:reply, stack, stack}

  @impl true
  def handle_cast({:set, stack}, _state), do: {:noreply, stack}
end
