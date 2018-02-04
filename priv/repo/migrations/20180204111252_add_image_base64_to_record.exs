defmodule RecordShop.Repo.Migrations.AddImageBase64ToRecord do
  use Ecto.Migration

  def change do
    alter table(:records) do
      add :image_base64, :text
    end
  end
end
