defmodule RecordShopWeb.Router do
  use RecordShopWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Poison
  end

  scope "/" do
    pipe_through :api

    forward "/api",
      Absinthe.Plug,
      schema: RecordShopWeb.Schema,
      interface: :simple

    forward "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: RecordShopWeb.Schema,
      interface: :simple,
      context: %{pubsub: RecordShopWeb.Endpoint}
  end
end