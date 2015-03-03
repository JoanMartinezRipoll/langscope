json.array!(@countries) do |country|
	json.extract! country, :id, :name, :population
	json.percentages country.percentages do |percentage|
		json.percentage percentage.percent
		json.languages percentage.languages.each do |language|
			json.extract! language, :id, :name
		end
	end
end
