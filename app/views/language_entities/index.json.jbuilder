json.array!(@language_entities) do |language_entity|
  json.extract! language_entity, :id, :name, :street, :plz, :email, :country_id
  json.url language_entity_url(language_entity, format: :json)
end
