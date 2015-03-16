FactoryGirl.define do

  factory :country do
    name "Germany"
    population 80716000
    code {Faker::Address.state_abbr}
  end

  factory :invalid_country, parent: :country do
    name nil
  end
end
