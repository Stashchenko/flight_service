json.data do
  json.array! @flights do |comment|
    json.(comment, *Flight.column_names - ['provider_id'])
    json.provider_name comment.provider.name
  end
end
json.meta do
  json.total_entries @flights.total_entries
end


