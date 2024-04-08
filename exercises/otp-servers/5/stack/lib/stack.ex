defmodule Stack do
  @server Stack.Server
  def start_link(stack), do: GenServer.start_link(@server, stack, name: @server)

  def pop, do: GenServer.call(@server, :pop)

  def push(elem), do: GenServer.cast(@server, {:push, elem})
  @moduledoc """
  Documentation for `Stack`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Stack.hello()
      :world

  """
  def hello do
    :world
  end
end
