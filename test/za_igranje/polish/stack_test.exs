  defmodule StackTest do

    use ExUnit.Case

    test "simplest computing example" do
      assert ZaIgranje.Polish.Stack.process(["+", 1, 1]) == {2, []}
    end

    test "complex computing example" do
      assert ZaIgranje.Polish.Stack.process(["+", "+", 1, 11, 21]) == {33, []}
    end

    #sta sve ovde moze da ide po zlu:
    #nema operatora uopste
    #nema brojeva
    #operatori nisu na dobrom mestu (npr operator na pocetku steka)
    #ima vise operatora nego brojeva

  #  test "operator missing" do  #mozda je problem u kodu
  #    try do
  #      assert_raise RuntimeError , fn -> ZaIgranje.Polish.process([1,2,3]) end
  #      |> IO.inspect(label: "posle funkcije asert rejz" )
  #      assert false
  #      |> IO.inspect(label: "posle prvog false")
  #    catch
  #      :exit, error ->
  #        assert {{%RuntimeError{}, _}, _} = error
  #      _, _ ->
  #        assert false
  #    end
  #  end

#  test "less then three elements on stack" do
#    try do
#        assert_raise RuntimeError , fn -> ZaIgranje.Polish.Stack.process([1,2]) end
#        |> IO.inspect(label: "posle funkcije asert rejz" )
#        assert false
#        |> IO.inspect(label: "posle prvog false")
#      catch
#        :exit, error ->
#          assert {{%RuntimeError{}, _}, _} = error
#        _, _ ->
#          assert false
#      end
#  end



  end
