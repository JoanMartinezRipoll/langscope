json.extract! @country, :id, :name, :population
json.result @country.percentages do |percentage|
     json.percentage percentage.percent
  	 json.languages percentage.languages.each do |language|
  	 	json.extract! language, :id, :name
  	 end
end
