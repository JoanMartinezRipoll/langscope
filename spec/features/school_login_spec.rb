require "rails_helper"

RSpec.feature "Login school", :type => :feature do
  let(:school) { create (:school) }

  scenario "School logs in" do
    visit new_school_session_path
    fill_in "Email", with: school.email
    fill_in "Password", with: school.password
    click_button "Log in"
    expect(page).to have_text("Signed in successfully.")
  end
end
