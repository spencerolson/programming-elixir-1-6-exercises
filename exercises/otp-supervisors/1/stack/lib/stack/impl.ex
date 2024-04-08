defmodule Stack.Impl do
  def pop([first | rest]) do
    {:ok, first, rest}
  end

  def push(elem, stack) do
    {:ok, elem, [elem | stack]}
  end
end
