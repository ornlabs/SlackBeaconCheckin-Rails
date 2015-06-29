json.array!(@uuids) do |uuid|
  json.extract! uuid, :id, :uuid, :location
  json.url uuid_url(uuid, format: :json)
end
