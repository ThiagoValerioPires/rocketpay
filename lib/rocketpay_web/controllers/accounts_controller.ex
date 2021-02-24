defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account

  action_fallback RocketpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Rocketpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> put_view(RocketpayWeb.AccountsView)
      |> render("update.json", %{account: account, message: "Deposit done!"})
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Rocketpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> put_view(RocketpayWeb.AccountsView)
      |> render("update.json", %{account: account, message: "Withdraw done!"})
    end
  end

end
