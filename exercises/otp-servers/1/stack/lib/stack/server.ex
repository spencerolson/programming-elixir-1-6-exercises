defmodule Stack.Server do
  use GenServer

  @impl true
  def init(stack), do: {:ok, stack}

  @impl true
  def handle_call(:pop, _client_pid, [first | rest]) do
    {:reply, first, rest}
  end
end
