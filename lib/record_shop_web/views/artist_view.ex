defmodule RecordShopWeb.ArtistView do
  use RecordShopWeb, :view

  alias RecordShop.Artists.Artist

  def render("show.json", %{artist: artist}) do
    %{
      id: artist.id,
      name: artist.name
    }
  end
end
