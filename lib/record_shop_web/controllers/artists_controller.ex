defmodule RecordShopWeb.ArtistController do
  use RecordShopWeb, :controller

  alias RecordShop.Artists

  def show(conn, %{"id" => id}) do
    artist = Artists.get_artist!(id)
    render(conn, "show.json", artist: artist)
  end
end
