# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
spain = Country.create(name: 'Spain', population: 46464053).id
germany = Country.create(name: 'Germany', population: 80716000).id
england = Country.create(name: 'England', population: 53012456).id
spanish = Language.create(name: 'Spanish').id
catalan = Language.create(name: 'Catalan').id
german = Language.create(name: 'German').id
english = Language.create(name: 'English').id
french = Language.create(name: 'French').id

#GERMANY
percentage = Percentage.new(percent: 70.0, country_id: germany)
percentage.language_ids = [german]
percentage.save

percentage = Percentage.new(percent: 20.0, country_id: germany)
percentage.language_ids = [german, english]
percentage.save

percentage = Percentage.new(percent: 10.0, country_id: germany)
percentage.language_ids = [german, english, spanish]
percentage.save

#ENGLAND
percentage = Percentage.new(percent: 90.0, country_id: england)
percentage.language_ids = [english]
percentage.save

percentage = Percentage.new(percent: 10.0, country_id: england)
percentage.language_ids = [english, french]
percentage.save

#SPAIN
percentage = Percentage.new(percent: 70.0, country_id: spain)
percentage.language_ids = [spanish]
percentage.save

percentage = Percentage.new(percent: 10.0, country_id: spain)
percentage.language_ids = [spanish, catalan]
percentage.save

percentage = Percentage.new(percent: 10.0, country_id: spain)
percentage.language_ids = [spanish, catalan, english]
percentage.save

percentage = Percentage.new(percent: 10.0, country_id: spain)
percentage.language_ids = [spanish, english]
percentage.save
