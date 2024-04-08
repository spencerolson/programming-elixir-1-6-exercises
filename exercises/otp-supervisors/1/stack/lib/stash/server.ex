defmodule Stash.Server do
  use GenServer

  alias Stash.Impl

  def start_link(stack), do: GenServer.start_link(__MODULE__, stack, name: __MODULE__)

  @impl true
  def init(stack), do: {:ok, stack}

  @impl true
  def handle_call(:get, _from, state) do
    {:ok, response, new_state} = Impl.get(state)
    {:reply, response, new_state}
  end

  @impl true
  def handle_cast({:set, desired_state}, state) do
    {:ok, _response, new_state} = Impl.set(desired_state, state)
    {:noreply, new_state}
  end
end
