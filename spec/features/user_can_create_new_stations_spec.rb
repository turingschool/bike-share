require_relative '../spec_helper'

RSpec.describe "When a user visits '/stations/new'" do
  it "they see a 'new' form to create a new station" do
    date = DateRef.create!(date: "2010-01-01")
    city = City.create!(name: "Denver")
    Station.create!(name: "Broadway", dock_count: 10, city_id: city.id, date_ref_id: date.id)

    visit('/stations/new')
    fill_in("station[name]", with: "15th st")
    fill_in("station[dock_count]", with: 13)
    fill_in("station[installation_date]", with: "2017-10-01")
    select("Denver", from: "station[city_id]")
    click_on "Create New Station"

    expect(current_path).to eq("/stations/2")
  end

  it "they see the form labels" do
    visit('/stations/new')
    expect(page).to have_content("Name:")
    expect(page).to have_content("Dock count:")
    expect(page).to have_content("Installation Date:")
  end
end