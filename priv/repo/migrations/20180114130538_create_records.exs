defmodule RecordShop.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :title, :string
      add :year, :integer

      timestamps()
    end

  end
end
