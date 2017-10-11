require "spec_helper"

RSpec.describe "When a user visits '/stations/:id'" do

  let(:station) do
    Station.create(
      name: "Miami Bike", 
      dock_count: 23, 
      city: "Miami", 
      installation_date: Date.today, 
      lat: 23.23,
      long: 34.32
    )
  end

  before do
    visit "/stations/#{station.id}"
  end

  it "they see a station name" do        
    expect(page).to have_content("Miami Bike")
  end

  it "they see dock count" do
    expect(page).to have_content("Dock Count: #{station.dock_count}")
  end

  it "they see city" do
    expect(page).to have_content("City: #{station.city}")
  end
end