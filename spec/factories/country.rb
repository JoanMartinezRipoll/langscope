FactoryGirl.define do

  factory :country do
    name "Germany"
    population 80716000
    code 'DEU'
    initialize_with { Country.find_or_create_by(code: code)}
  end
end
