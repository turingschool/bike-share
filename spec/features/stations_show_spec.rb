require_relative '../spec_helper'

RSpec.describe "when a user visits /stations/:id" do
  it "they see a single station's info" do
    City.create(name:"San Jose")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    visit '/stations/1'

    within("h1.title") do
      expect(page).to have_content("Union Station")
    end

      expect(page).to have_content("Bike Capacity: 12")
      expect(page).to have_content("Installation Date: 2016-05-15")
      expect(page).to have_content("City: San Jose")
  end

  it "they can delete that station" do
    City.create(name:"San Jose")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    visit '/stations/1'

    click_on "Delete"

    expect(current_path).to eq("/stations")

    within("table") do
      expect(page).not_to have_content("Union Station")
    end
  end
end
