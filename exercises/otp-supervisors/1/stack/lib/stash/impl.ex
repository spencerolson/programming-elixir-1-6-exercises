defmodule Stash.Impl do
  def get([first | rest]) do
    {:ok, first, rest}
  end

  def set(desired_stack, _stack) do
    {:ok, desired_stack}
  end
end
