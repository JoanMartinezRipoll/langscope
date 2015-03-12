FactoryGirl.define do

  factory :school do
    email "school@example.com"
    password "password"
    password_confirmation "password"
    name "Example School"
    address "Alexanderplatz 2"
    plz "10178"
    country
  end

  factory :invalid_school, parent: :school do
    email nil
  end
end
