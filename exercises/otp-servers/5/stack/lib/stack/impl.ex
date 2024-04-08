defmodule Stack.Impl do
  def pop([first | rest]), do: {:ok, first, rest}

  def push(stack, elem), do: {:ok, elem, [elem | stack]}
end
