defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Here is you number #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)

  end

  def lowercase(conn, %{"name" => name}) do
    result = name
    |> String.trim()
    |> String.downcase()

    conn
    |> put_status(:ok)
    |> json(%{message: "Your name is #{result}"})
  end

end
