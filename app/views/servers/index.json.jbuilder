json.array!(@servers) do |server|
  json.extract! server, :server_name, :vendor, :processor, :memory
  json.url server_url(server, format: :json)
end
