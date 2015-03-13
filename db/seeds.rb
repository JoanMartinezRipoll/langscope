# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#======COUNTRIES=======
spain = Country.create(name: 'Spain', population: 46464053, code:'ESP').id
germany = Country.create(name: 'Germany', population: 80716000, code:'DEU').id
england = Country.create(name: 'England', population: 53012456, code:'GBR').id
italy = Country.create(name: 'Italy', population: 60782668, code:'ITA').id
us = Country.create(name: 'United States', population: 320206000, code:'USA').id
canada = Country.create(name: 'Canada', population: 35675834, code:'CAN').id
spanish = Language.create(name: 'Spanish').id
catalan = Language.create(name: 'Catalan').id
german = Language.create(name: 'German').id
english = Language.create(name: 'English').id
french = Language.create(name: 'French').id
italian = Language.create(name: 'Italian').id

#======PERCENTAGES=======
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

#US
percentage = Percentage.new(percent: 60.0, country_id: us)
percentage.language_ids = [english]
percentage.save

percentage = Percentage.new(percent: 20.0, country_id: us)
percentage.language_ids = [spanish, english]
percentage.save

percentage = Percentage.new(percent: 10.0, country_id: us)
percentage.language_ids = [english, italian]
percentage.save

percentage = Percentage.new(percent: 5.0, country_id: us)
percentage.language_ids = [french, english]
percentage.save

percentage = Percentage.new(percent: 5.0, country_id: us)
percentage.language_ids = [spanish, english, italian]
percentage.save


#======SCHOOLS=======
berlin_school = School.create(email: "berlin@schools.com", password: "password", password_confirmation: "password", name: "Berlin School", address: "Alexanderplatz 2", plz: "10178", country_id: germany).id
chicago_school = School.create(email: "chicago@schools.com", password: "password", password_confirmation: "password", name: "Chicago School", address: "Western Ave 3", plz: "332B", country_id: us).id
london_school = School.create(email: "london@schools.com", password: "password", password_confirmation: "password", name: "London School", address: "Camden High St 3A", plz: "NW1 7JE", country_id: england).id
School.create(email: "langscope@lang.com", password: "legionella", password_confirmation: "legionella", name: "Legionella School", address: "Camden High St 3A", plz: "NW1 7JE", country_id: england, admin: true)


#======OFFERS=======
#Berlin school
LanguageOffer.create(school_id: berlin_school, language_id: german, price: 200, level: "A1, B2")
LanguageOffer.create(school_id: berlin_school, language_id: english, price: 400, level: "A2, B2")
LanguageOffer.create(school_id: berlin_school, language_id: italian, price: 1000, level: "C2")
