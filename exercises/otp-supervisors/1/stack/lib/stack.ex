defmodule Stack do
  @server Stack.Server

  def pop, do: GenServer.call(@server, :pop)

  def push(elem), do: GenServer.cast(@server, {:push, elem})

  def crash, do: GenServer.stop(@server)
end
