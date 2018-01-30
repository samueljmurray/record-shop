defmodule RecordShopWeb.RecordsResolver do
  alias RecordShop.Records

  def list_records(_root, args, _info) do
    records = Records.list_records(args, [:artists])
    {:ok, records}
  end

  def get_record(_root, %{id: id}, _info) do
    record = Records.get_record!(id, [:artists])
    {:ok, record}
  end

  def create_record(_root, args, _info) do
    case Records.create_record(args) do
      {:ok, record} -> {:ok, record}
      _error -> {:error, "Could not create record"}
    end
  end

  def update_record(_root, %{id: id} = args, _info) do
    record = Records.get_record!(id, [:artists])

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

  def set_record_archived(_root, args, _info) do
    record = Records.get_record!(args[:id], [:artists])

    case Records.update_record(record, args) do
      {:ok, record} -> {:ok, record}
      _error -> {:error, "Could not update record"}
    end
  end

  def count_records(_root, _args, _info) do
    count = Records.count_records()
    {:ok, count}
  end
end
