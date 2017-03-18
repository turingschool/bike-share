require_relative '../spec_helper'

RSpec.describe "when a user visits /stations"
  it "they see all stations" do
    visit '/stations'

    within("h1.title") do
      expect(page).to have_content("All Stations")
    end

    #come back to me
    within("ul:first-child") do
      expect(page).to have_content("Station Name")
    end
  end
end