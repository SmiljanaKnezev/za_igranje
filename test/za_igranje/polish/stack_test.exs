  defmodule StackTest do

    use ExUnit.Case
    # doctest ZaIgranje.Polish.Stack

    test "simplest computing example" do
      assert ZaIgranje.Polish.Stack.process(["+", 1, 1]) == {2, []}
    end

    test "complex computing exampla" do
      assert ZaIgranje.Polish.Stack.process(["+", "+", 1, 11, 21]) == {33, []}
    end

  end
