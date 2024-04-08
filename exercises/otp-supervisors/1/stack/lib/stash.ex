defmodule Stash do
  @server Stash.Server

  def get, do: GenServer.call(@server, :get)

  def set(stack), do: GenServer.cast(@server, {:set, stack})
end
