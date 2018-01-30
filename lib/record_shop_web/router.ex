defmodule RecordShopWeb.Router do
  use RecordShopWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Corsica,
         origins: "http://localhost:3000",
         allow_headers: ["content-type"]

    plug Plug.Parsers,
         parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
         pass: ["*/*"],
         json_decoder: Poison
  end

  scope "/" do
    pipe_through(:api)

    forward "/graphql",
            Absinthe.Plug, 
            schema: RecordShopWeb.Schema,
            interface: :simple

    forward "/graphiql",
            Absinthe.Plug.GraphiQL,
            schema: RecordShopWeb.Schema,
            interface: :simple,
            context: %{pubsub: RecordShopWeb.Endpoint}

    scope "/api", RecordShopWeb do
      get "/records", RecordController, :index
      get "/artists/:id", ArtistController, :show
    end
  end
end
