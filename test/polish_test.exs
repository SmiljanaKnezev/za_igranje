defmodule PolishTest do

  use ExUnit.Case

  test "test polish" do
    assert ZaIgranje.Polish.push("5") == [5]
    assert ZaIgranje.Polish.push("3") == [3, 5]
    assert ZaIgranje.Polish.push("4") == [4,3,5]
    assert ZaIgranje.Polish.push("+") == ["+", 4, 3, 5]
    assert ZaIgranje.Polish.push("+") == ["+", "+", 4, 3, 5]
    assert ZaIgranje.Polish.compute() == 12
  end

  test "push invalid character" do
    # assert_raise RuntimeError , fn -> ZaIgranje.Polish.push("hello") end
    try do
      assert_raise RuntimeError , fn -> ZaIgranje.Polish.push("hello") end
      assert false
    catch
      :exit, error ->
        assert {{%RuntimeError{}, _}, _} = error
      _, _ ->
        assert false
    end
  end

end
