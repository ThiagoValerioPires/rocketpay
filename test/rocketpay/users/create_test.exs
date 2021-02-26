defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true


  alias Rocketpay.User
  alias Rocketpay.Users.Create


  describe "call/1" do

    test "when all parameter are valid, returns an user" do
      params = %{
        name: "Thiago",
        password: "123456",
        nickname: "thiago",
        email: "thiago.valerio@gmail.com",
        age: 41
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{
        name: "Thiago",
        nickname: "thiago",
        email: "thiago.valerio@gmail.com",
        age: 41,
        id: ^user_id} = user
    end

    test "when there are valid parameters, returns an user" do
      params = %{
        name: "Thiago",
        nickname: "thiago",
        email: "thiago.valerio@gmail.com",
        age: 10
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{age: ["must be greater than or equal to 18"], password: ["can't be blank"]}

      assert expected_response == errors_on(changeset)
    end

  end
end
