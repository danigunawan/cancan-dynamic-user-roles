json.array!(@applications) do |application|
  json.extract! application, :name, :version, :vendor
  json.url application_url(application, format: :json)
end
