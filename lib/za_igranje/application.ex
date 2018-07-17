defmodule ZaIgranje.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    alias Plug.Adapters.Cowboy

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: ZaIgranje.Worker.start_link(arg1, arg2, arg3)
      # worker(ZaIgranje.Worker, [arg1, arg2, arg3]),
      Cowboy.child_spec(:http, ZaIgranje.Router, [], [port: 4000]),
      ZaIgranje.Polish,

    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ZaIgranje.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
