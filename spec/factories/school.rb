FactoryGirl.define do

  factory :school do
    email {Faker::Internet.email}
    password "password"
    password_confirmation "password"
    name "Example School"
    address {Faker::Address.street_address}
    plz {Faker::Address.postcode}
    country
  end

  factory :invalid_school, parent: :school do
    email nil
  end
end
