defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.{Account}

  def render("update.json", %{account: %Account{id: id, balance: balance}, message: message}) do
    %{
      message: message,
      account: %{
        id: id,
        balance: balance
      }
    }
  end
end
