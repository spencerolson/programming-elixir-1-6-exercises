defmodule Stack.Server do
  use GenServer
  import Stack.Impl

  @impl true
  def init(stack), do: {:ok, stack}

  @impl true
  def handle_call(:pop, _client_pid, stack) do
    {:ok, reply, new_stack} = pop(stack)
    {:reply, reply, new_stack}
  end

  @impl true
  def handle_cast({:push, elem}, stack) do
    {:ok, _reply, new_stack} = push(stack, elem)
    {:noreply, new_stack}
  end

  @impl true
  def terminate(reason, state) do
    IO.puts("Terminating! reason: #{inspect reason}, state: #{inspect state}")
  end
end
