require_relative '../spec_helper'

RSpec.describe "when a user visits /stations" do
  it "they see all stations" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    visit '/stations'

    within("h1.title") do
      expect(page).to have_content("All Stations")
    end

    #come back to me
    within("li:first-child") do
      expect(page).to have_content("Union Station")
    end
  end

  it "they can edit a station" do
     Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
     visit "/stations"

      within("li:first-child button") do
        click_on "Edit"
      end 
      expect(current_path).to eq("/stations/1/edit")
  end
  
  it "they can delete stations" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    visit '/stations'

    within("li:first-child") do
      click_on "Delete"
    end
    expect(current_path).to eq("/stations")

    expect(page).not_to have_content("Union Station")
  end
end