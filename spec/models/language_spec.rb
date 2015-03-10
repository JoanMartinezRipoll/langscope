require 'rails_helper'

describe Language, type: :model do
  it "returns the language name" do
    #setup
    #create_language_with_percentage_in_country (percentage, sharedwithOtherlanguages, country)
    england = create(:country, name:"England", code: "ENG")
    english = create(:language_with_percentage_in_contry, name:"English", percent:100.0, country:england)
    puts english.id
    scope, world_ratio = Language.get_scope_of([english])
    expect(world_ratio).to eq 100.0
    expect(scope.length).to eq 1
    expect(scope["ENG"]).to_not be_nil
  end
end

# Prefix instance methods with a '#'
# describe User, '#name' do
#   it 'returns the concatenated first and last name' do
#     # setup
#     user = build(:user, first_name: 'Josh', last_name: 'Steiner')

#     # excercise and verify
#     expect(user.name).to eq 'Josh Steiner'
#   end
