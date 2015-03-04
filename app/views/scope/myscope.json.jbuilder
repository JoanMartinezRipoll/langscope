json.world_ratio @world_ratio
json.result @scope do |key, value|
	json.country_id key
	json.ratio value[0]
end

