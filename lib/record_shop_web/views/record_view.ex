defmodule RecordShopWeb.RecordView do
  use RecordShopWeb, :view

  alias RecordShop.Records.Record

  def render("index.json", %{records: records, conn: conn}) do
    Enum.map(records, fn (record) -> render_record(conn, record) end)
  end

  def render("show.json", %{record: record, conn: conn}) do
    render_record(conn, record)
  end

  def render_record(conn, %Record{} = record) do
    Map.new
    |> Map.put(:id, record.id)
    |> Map.put(:title, record.title)
    |> Map.put(:year, record.year)
    |> Map.put(:artists, Enum.map(record.artists, &(artist_url(conn, :show, &1))))
    |> Map.put(:archived_at, record.archived_at)
  end
end
