json.array!(@services) do |service|
  json.extract! service, :id, :type, :data
  json.url service_url(service, format: :json)
end
