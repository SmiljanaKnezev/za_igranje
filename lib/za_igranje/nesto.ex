defmodule ZaIgranje.Nesto do

  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(_), do: {:ok, []}

  def handle_call({:push, value}, _from, state) do
    state = [value | state]
    {:reply, state, state}
  end

  def handle_call(:add, _from, state) when length(state) >  1 do
    [val1 | state] = state
    [val2 | state] = state
    new_val = val1 + val2;
    state = [new_val | state]
    {:reply, state, state}
  end



  def process(state) do
    [op | state] = state
    process(op, state)
  end

  def process(op, state)  do
    val1 = get_operand(state)
    val2 = get_operand(state)
    compute(op, val1, val2)
  end

  def get_operand([v | state]), do: do_get_operand(v, state)

  def do_get_operand(val, state) when is_number(val), do: val
  def do_get_operand(val, state), do: process(val, state)

  def compute(_op, val1, val2), do: val1 + val2




end
