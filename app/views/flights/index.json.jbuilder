json.data do
  json.array! @flights do |comment|
    json.(comment, *Flight.column_names - ['provider_id'])
    json.provider_name comment.provider.name
  end
end


