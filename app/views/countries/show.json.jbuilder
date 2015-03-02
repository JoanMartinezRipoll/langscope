json.extract! @country, :id, :name, :population, :created_at, :updated_at
json.result @country.percentages do |percentage|
     json.percentage percentage.percent
  	 json.languages percentage.languages.collect!{ |language| language.name}
end
