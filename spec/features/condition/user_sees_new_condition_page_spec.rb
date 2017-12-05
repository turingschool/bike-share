require 'spec_helper'

describe "when user visits /conditions/new path" do
  it "will show a Create New Condition page" do
    visit '/conditions/new'

    expect(page).to have_content("New Weather Condition")
  end

  it "will see links for home, conditions index" do
    visit '/conditions/new'

    expect(page).to have_link("Conditions", :href => "/conditions")
    expect(page).to have_link("Home", :href=>"/")
  end

  it "will see form to enter information for condition" do
    visit '/conditions/new'

    expect(page).to have_content("Date:")
    expect(page).to have_content("Precipitation(inches):")
  end

end
