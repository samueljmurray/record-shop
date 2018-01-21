defmodule RecordShop.Repo.Migrations.AddArchivedAtToRecords do
  use Ecto.Migration

  def change do
    alter table(:records) do
      add :archived_at, :utc_datetime
    end
  end
end
