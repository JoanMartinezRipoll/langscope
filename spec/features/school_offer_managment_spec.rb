require "rails_helper"

RSpec.feature "Offers management", :type => :feature do
  let!(:school) { create(:school) }
  let!(:language) {create(:language)}
  before :each do
    visit new_school_session_path
    fill_in "Email", with: school.email
    fill_in "Password", with: school.password
    click_button "Log in"
  end

  describe 'add offer', :js => true do
    it "clicks add offer and saves the offer" do
      visit edit_school_path(school.id)
      click_link 'Add language offer'
      select(language.name, from: "school_language_offers_attributes_1_language_id")
      fill_in "Price", with: 20
      fill_in "Level", with: "B1"
      click_button "Save changes"
      expect(page).to have_text("Profile updated")
      expect(page).to have_text(language.name)
    end
  end
end
