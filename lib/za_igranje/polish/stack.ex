defmodule ZaIgranje.Polish.Stack do

  def process(state) do
    [op | state] = state
    process(op, state)
  end

  def process(op, state)  do

    {val1, state} = get_operand(state)
    {val2, state} = get_operand(state)
    {compute(op, val1, val2), state}
  end

  def get_operand([v | state]), do: do_get_operand(v, state)

  def do_get_operand(val, state) when is_number(val), do: {val, state}
  def do_get_operand(val, state), do: process(val, state)

  def compute("+", val1, val2), do: val1 + val2
  def compute("-", val1, val2), do: val1 - val2

end
