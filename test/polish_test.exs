defmodule PolishTest do

  use ExUnit.Case

  test "test polish" do
    assert ZaIgranje.Polish.push(5) == [5]
    assert ZaIgranje.Polish.push(3) == [3, 5]
    assert ZaIgranje.Polish.push(4) == [4,3,5]
    assert ZaIgranje.Polish.push("+") == ["+", 4, 3, 5]
    assert ZaIgranje.Polish.push("+") == ["+", "+", 4, 3, 5]
    assert ZaIgranje.Polish.compute() == 12
  end


end
