json.array!(@beacons) do |beacon|
  json.extract! beacon, :id, :name, :lat, :long, :beacon
  json.url beacon_url(beacon, format: :json)
end
