defmodule RecordShop.Records do
  @moduledoc """
  The Records context.
  """

  import Ecto.Query, warn: false
  alias RecordShop.Repo

  alias RecordShop.Records.Record

  def list_records(args) do
    limit = args[:limit] || 10
    offset = args[:offset] || 0

    Record
    |> limit(^limit)
    |> offset(^offset)
    |> maybe_filter_by_artist_ids(args)
    |> Repo.all()
  end

  def list_records(args, preloads) when is_list(preloads) do
    args
    |> list_records()
    |> Repo.preload(preloads)
  end

  def get_record!(id), do: Repo.get!(Record, id)

  def get_record!(id, preloads) when is_list(preloads) do
    id
    |> get_record!
    |> Repo.preload(preloads)
  end

  def create_record(attrs \\ %{}) do
    %Record{}
    |> Record.changeset(attrs)
    |> Repo.insert()
  end

  def update_record(%Record{} = record, attrs) do
    record
    |> Record.changeset(attrs)
    |> Repo.update()
  end

  def delete_record(%Record{} = record) do
    Repo.delete(record)
  end

  def change_record(%Record{} = record) do
    Record.changeset(record, %{})
  end

  def count_records() do
    Repo.aggregate(Record, :count, :id)
  end

  defp maybe_filter_by_artist_ids(query, %{artist_ids: artist_ids} = args) do
    from r in query,
      left_join: a in assoc(r, :artists),
      where: a.id in ^artist_ids
  end
  defp maybe_filter_by_artist_ids(query, _args), do: query
end
