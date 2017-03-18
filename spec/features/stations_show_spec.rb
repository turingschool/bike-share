require_relative '../spec_helper'

RSpec.describe "when a user visits /stations/:id" do
  it "they see a single station's info" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    visit '/stations/1'

    within("h2.station-name") do
      expect(page).to have_content("Union Station")
    end

    #come back to me
      expect(page).to have_content("Bike Capacity: 12")
      #expect(page).to have_content("Installation Date: Sun, 15 May 2016")
  end

  it "they can delete that station" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    visit '/stations/1'
    
    click_on "Delete"

    expect(current_path).to eq("/stations")

    within("ul") do
      expect(page).not_to have_content("Union Station")
    end
  end
end