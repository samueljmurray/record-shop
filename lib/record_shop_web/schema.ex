defmodule RecordShopWeb.Schema do
  use Absinthe.Schema
  alias RecordShopWeb.RecordsResolver

  import_types(Absinthe.Type.Custom)

  object :record do
    field(:id, non_null(:id))
    field(:title, non_null(:string))
    field(:year, non_null(:integer))
    field(:image_base64, :string)
    field(:artists, non_null(list_of(non_null(:artist))))
    field(:archived_at, :datetime)
  end

  object :artist do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
  end

  query do
    field :records, non_null(list_of(non_null(:record))) do
      arg(:limit, :integer)
      arg(:offset, :integer)
      arg(:artist_ids, list_of(non_null(:integer)))

      resolve(&RecordsResolver.list_records/3)
    end

    field :record, non_null(:record) do
      arg(:id, non_null(:id))

      resolve(&RecordsResolver.get_record/3)
    end

    field :records_count, non_null(:integer) do
      resolve(&RecordsResolver.count_records/3)
    end
  end

  mutation do
    field :create_record, :record do
      arg(:title, non_null(:string))
      arg(:year, non_null(:integer))
      arg(:artist_ids, non_null(list_of(non_null(:integer))))
      arg(:image_base64, :string)

      resolve(&RecordsResolver.create_record/3)
    end

    field :update_record, :record do
      arg(:id, non_null(:id))
      arg(:title, :string)
      arg(:year, :integer)
      arg(:artist_ids, list_of(non_null(:integer)))
      arg(:image_base64, :string)

      resolve(&RecordsResolver.update_record/3)
    end

    field :delete_record, :record do
      arg(:id, non_null(:id))

      resolve(&RecordsResolver.delete_record/3)
    end

    field :set_record_archived, :record do
      arg(:id, non_null(:id))
      arg(:archived, non_null(:boolean))

      resolve(&RecordsResolver.set_record_archived/3)
    end
  end
end
