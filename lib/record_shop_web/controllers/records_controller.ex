defmodule RecordShopWeb.RecordController do
  use RecordShopWeb, :controller

  alias RecordShop.Records

  def index(conn, %{"limit" => limit, "offset" => offset}) do
    args = %{
      limit: String.to_integer(limit),
      offset: String.to_integer(offset)
    }
    records = Records.list_records(args, [:artists])
    render(conn, "index.json", conn: conn, records: records)
  end
end
