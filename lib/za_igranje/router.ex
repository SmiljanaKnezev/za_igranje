defmodule ZaIgranje.Router do

  require Logger
  use Plug.Router

  plug Plug.Logger
#   plug Plug.Parsers, parsers: [:urlencoded, :json],
#                      pass:  ["*/*"],
#                      json_decoder: Poison

  plug :match
  plug :dispatch

  get "/za-igranje" do
    send_resp(conn, 200, "Hello micro-service!")
  end

  get "/za-igranje/push/:pera" do
    rezultat = pera
     |> convert()
     |> ZaIgranje.Polish.push()
    conn
    |> put_resp_header("Content-Type", "text/plain")
    |> send_resp(200, "Stack: #{inspect(rezultat)}")
  end


  get "/za-igranje/compute" do
    {code, response} =
    Wormhole.capture(fn -> ZaIgranje.Polish.compute() end)
    |> response_handler()
    send_resp(conn, code, "Computing result: #{inspect response}")
  end

  def response_handler(value) do
    value
    |> case do
      {:ok, value} -> {200, value}
      {:error, {:shutdown, {:exit, {{%RuntimeError{}, _}, _}}}} -> {400, "reason"}
      error -> {500, error}
    end
  end

  get "/health_check/ping" do
    send_resp(conn, 200, "pong")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

end
