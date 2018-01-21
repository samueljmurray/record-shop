defmodule RecordShopWeb.Schema do
  use Absinthe.Schema
  alias RecordShopWeb.RecordsResolver

  import_types(Absinthe.Type.Custom)

  object :record do
    field(:id, non_null(:id))
    field(:title, non_null(:string))
    field(:year, non_null(:integer))
    field(:artists, non_null(list_of(non_null(:artist))))
    field(:archived_at, :datetime)
  end

  object :artist do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
  end

  query do
    field :list_records, non_null(list_of(non_null(:record))) do
      arg(:first, non_null(:integer))
      arg(:page, non_null(:integer))
      resolve(&RecordsResolver.list_records/3)
    end

    field :get_record, non_null(:record) do
      arg(:id, non_null(:id))
      resolve(&RecordsResolver.get_record/3)
    end
  end

  mutation do
    field :create_record, :record do
      arg(:title, non_null(:string))
      arg(:year, non_null(:integer))
      arg(:artist_ids, non_null(list_of(non_null(:integer))))

      resolve(&RecordsResolver.create_record/3)
    end

    field :update_record, :record do
      arg(:id, non_null(:id))
      arg(:title, :string)
      arg(:year, :integer)
      arg(:artist_ids, list_of(non_null(:integer)))

      resolve(&RecordsResolver.update_record/3)
    end

    field :delete_record, :record do
      arg(:id, non_null(:id))

      resolve(&RecordsResolver.delete_record/3)
    end

    field :record_set_archived, :record do
      arg(:id, non_null(:id))
      arg(:archived, non_null(:boolean))

      resolve(&RecordsResolver.record_set_archived/3)
    end
  end
end
