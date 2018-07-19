defmodule ZaIgranje.Polish do

  use GenServer
  alias ZaIgranje.Polish.Stack
  require String

  def start_link(_) do
    {:ok, _} = GenServer.start_link(__MODULE__, :ok, name: ServerZaIgranje)
  end

  def init(_), do: {:ok, []}

  def handle_call({:push, value}, _from, state) do
    value |> IO.inspect(label: "ZZZZZZZZZZZZZZZz")
    state = [convert(value) | state]
    {:reply, state, state}
  end

  # def handle_call(:add, _from, state) when length(state) >  1 do
  #   [val1 | state] = state
  #   [val2 | state] = state
  #   new_val = val1 + val2;
  #   state = [new_val | state]
  #   {:reply, state, state}
  # end

  def handle_call(:compute , _from, state) when length(state) > 2 do
    {value, new_state} = Stack.process(state)
    {:reply, value, new_state}
  end

  def handle_call(:compute , _from, state)  do
    raise "Less than two elements on stack : #{inspect state}"
  end

  #pomocne funkcije
  defp convert(op) when op in ["+", "-"], do: op

  defp convert(value) do
    case value |> IO.inspect(label: "WWWWWWWWWWWWWWWW") |> Integer.parse() do
      {int, _} -> int
      _ -> raise "Excepting +, - or integers. '#{inspect value}' not supported"
    end
  end


  def push(value) do
    GenServer.call(ServerZaIgranje, {:push, value} )
  end

#  def add_top_two() do
#    GenServer.call(ServerZaIgranje, :add)
#  end

  def compute() do
    GenServer.call(ServerZaIgranje, :compute)
  end

end
