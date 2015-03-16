FactoryGirl.define do

  factory :language do
    name "German"

    factory :language_with_percentage_in_contry do
      transient do
        percent 100.0
        country nil
      end

      after(:create) do |language, evaluator|
        percentage = evaluator.country ?
          create(:percentage, percent:evaluator.percent, country:evaluator.country) :
          create(:percentage, percent:evaluator.percent)
        create_list(:percent_language, 1, language: language, percentage: percentage)
      end
    end
  end

  factory :invalid_language, parent: :language do
    name ""
  end
end
