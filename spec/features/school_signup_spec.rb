require "rails_helper"

RSpec.feature "Sign up school", :type => :feature do
  let!(:country) { create(:country) }

  scenario "School registers" do
    visit new_school_registration_path
    fill_in "Email", with: "examle@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Name", with: "Example"
    fill_in "Address", with: "examplestr 3"
    fill_in "Plz", with: "12345"
    select(country.name, from: "school_country_id")
    click_button "Sign up"
    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
end
