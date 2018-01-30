defmodule RecordShopWeb.ArtistView do
  use RecordShopWeb, :view

  alias RecordShop.Artists.Artist

  def render("show.json", %{artist: artist}) do
    Map.new
    |> Map.put(:id, artist.id)
    |> Map.put(:name, artist.name)
  end
end
