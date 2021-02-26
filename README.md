# Rocketpay

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

to start interactive mode:
iex -S mix

to start the phoenix server:
mix phx.server

to create a new migration file:
mix ecto.gen.migration create_accounts_table

to preload account:
Rocketpay.Repo.all(Rocketpay.User) |> Rocketpay.Repo.preload(:account)

to download dependencies:
mix deps get