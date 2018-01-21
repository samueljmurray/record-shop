defmodule RecordShop.Repo.Migrations.CreateRecordsArtists do
  use Ecto.Migration

  def change do
    create table(:records_artists) do
      add :record_id, references(:records)
      add :artist_id, references(:artists)
    end

    create unique_index(:records_artists, [:record_id, :artist_id])
  end
end
