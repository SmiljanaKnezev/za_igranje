  defmodule StackTest do

    use ExUnit.Case

    test "simplest computing example" do
      assert ZaIgranje.Polish.Stack.process(["+", 1, 1]) == {2, []}
    end

    test "complex computing example" do
      assert ZaIgranje.Polish.Stack.process(["+", "+", 1, 11, 21]) == {33, []}
    end

  end
