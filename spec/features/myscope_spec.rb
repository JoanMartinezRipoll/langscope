require "rails_helper"

RSpec.feature "My scope test", :type => :feature do

  let!(:country) { create(:country, name:"England", code: "GBR") }
  let!(:language) { create(:language_with_percentage_in_contry, name:"English", percent:100.0, country:country) }

  it 'shows scope', :js => true do
    visit root_path
    select(language.name, from: "scope_language_ids")
    click_button "Check my scope"
    expect(page).to have_content('You can comunicate with 100.0 percent of the world population')
  end
end

# class="datamaps-subunit ESP" data-info="{&quot;fillKey&quot;:&quot;LOW&quot;,&quot;population&quot;:&quot;92928106.4&quot;,&quot;percentage&quot;:&quot;20.0&quot;}" data-previousAttributes="{&quot;fill&quot;:&quot;rgb(101, 199, 255)&quot;,&quot;stroke&quot;:&quot;rgb(255, 255, 255)&quot;,&quot;stroke-width&quot;:&quot;1px&quot;,&quot;fill-opacity&quot;:&quot;1&quot;}" style="fill: rgb(101, 199, 255); stroke-width: 1px; stroke: rgb(255, 255, 255); fill-opacity: 1;"></path>
