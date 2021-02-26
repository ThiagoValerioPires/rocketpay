defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Thiago",
      password: "123456",
      nickname: "thiago",
      email: "thiago.valerio@gmail.com",
      age: 41
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
                            message: "User created",
                            user: %{
                              account: %{
                                balance: Decimal.new("0"),
                                id: account_id
                              },
                              id: user_id,
                              name: "Thiago",
                              nickname: "thiago"
                            }
                          }

    assert response == expected_response

  end

end
