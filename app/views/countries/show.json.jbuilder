json.extract! @country, :id, :name, :population, :created_at, :updated_at
json.result @country.percentage do |percentage|
     json.percentage percentage.percent
  	 json.languages percentage.language.pluck("name")
end
