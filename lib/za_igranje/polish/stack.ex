defmodule ZaIgranje.Polish.Stack do

  def process(state) do
    [op | state] = state
    process(op, state)
  end

  def process(op, state)  do
    state     |> IO.inspect(label: "WWWWWW")

    {val1, state} = get_operand(state)
    |> IO.inspect(label: "QQQQQQQ")
    {val2, state} = get_operand(state)
    |> IO.inspect(label: "val2")
    {compute(op, val1, val2), state}
  end

  def get_operand([v | state]), do: do_get_operand(v, state)

  def do_get_operand(val, state) when is_number(val), do: {val, state}
  def do_get_operand(val, state), do: process(val, state)

  def compute(_op, val1, val2), do: val1 + val2

end
