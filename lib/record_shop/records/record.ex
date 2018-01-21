defmodule RecordShop.Records.Record do
  use Ecto.Schema
  import Ecto.Changeset
  alias RecordShop.Records.Record
  alias RecordShop.Artists


  schema "records" do
    field :title, :string
    field :year, :integer
    field :archived_at, :utc_datetime
    field :archived, :boolean, virtual: true

    many_to_many :artists, RecordShop.Artists.Artist, join_through: "records_artists", on_replace: :delete, on_delete: :delete_all

    timestamps()
  end

  def changeset(%Record{} = record, attrs) do
    record
    |> cast(attrs, [:title, :year])
    |> put_artists(attrs)
    |> put_archived_at(attrs)
    |> validate_required([:title, :year, :artists])
  end

  defp put_artists(changeset, %{artist_ids: artist_ids}) do
    artists = Enum.map(artist_ids, &Artists.get_artist!/1)
    put_assoc(changeset, :artists, artists)
  end
  defp put_artists(changeset, _attrs), do: changeset

  defp put_archived_at(changeset, %{archived: true}) do
    put_change(changeset, :archived_at, DateTime.utc_now())
  end
  defp put_archived_at(changeset, %{archived: false}) do
    put_change(changeset, :archived_at, nil)
  end
  defp put_archived_at(changeset, _attrs), do: changeset
end
