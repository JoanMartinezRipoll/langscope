require 'rails_helper'

describe Language, type: :model do
  it "returns the language name" do
    #setup
    england = create(:country, name:"England", code: "ENG")
    english = create(:language_with_percentage_in_contry, name:"English", percent:100.0, country:england)
    #exercise
    scope, world_ratio = Language.get_scope_of([english])
    #verify
    expect(world_ratio).to eq 100.0
    expect(scope.length).to eq 1
    expect(scope["ENG"]).to_not be_nil
  end
end
