defmodule RecordShopWeb.RecordsResolver do
  alias RecordShop.Records

  def list_records(_root, args, _info) do
    records = Records.list_records(args, [:artists])
    {:ok, records}
  end

  def get_record(_root, args, _info) do
    record = Records.get_record!(args[:id], [:artists])
    {:ok, record}
  end

  def create_record(_root, args, _info) do
    case Records.create_record(args) do
      {:ok, record} -> {:ok, record}
      _error -> {:error, "Could not create record"}
    end
  end

  def update_record(_root, args, _info) do
    record = Records.get_record!(args[:id], [:artists])

    case Records.update_record(record, args) do
      {:ok, record} -> {:ok, record}
      _error -> {:error, "Could not update record"}
    end
  end

  def delete_record(_root, args, _info) do
    record = Records.get_record!(args[:id], [:artists])

    case Records.delete_record(record) do
      {:ok, record} -> {:ok, record}
      _error -> {:error, "Could not delete record"}
    end
  end

  def record_set_archived(_root, args, _info) do
    record = Records.get_record!(args[:id], [:artists])

    case Records.update_record(record, args) do
      {:ok, record} -> {:ok, record}
      _error -> {:error, "Could not update record"}
    end
  end
end
