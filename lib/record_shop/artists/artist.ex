defmodule RecordShop.Artists.Artist do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecordShop.Artists.Artist


  schema "artists" do
    field :name, :string

    many_to_many :records, RecordShop.Records.Record, join_through: "records_artists", on_replace: :delete, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(%Artist{} = artist, attrs) do
    artist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
