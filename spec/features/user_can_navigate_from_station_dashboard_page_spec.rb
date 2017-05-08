require_relative '../spec_helper'

RSpec.describe "When a user visits '/stations-dashboard'" do
  it "they see dashboard data labels" do
    date0 = DateRef.create!(date: "2010-01-01")
    date1 = DateRef.create!(date: "2016-01-01")
    date2 = DateRef.create!(date: "2017-01-01")
    city = City.create!(name: "Denver")
    Station.create!(name: "Broadway", dock_count: 10, city_id: city.id, date_ref_id: 1)
    Station.create!(name: "Market", dock_count: 100, city_id: city.id, date_ref_id: 2)
    Station.create!(name: "Turing", dock_count: 1, city_id: city.id, date_ref_id: 2)
    Station.create!(name: "Lawrence", dock_count: 11, city_id: city.id, date_ref_id: 3)

    visit('/stations-dashboard')
    expect(page).to have_content("Total station count")
    expect(page).to have_content("Average bikes per station")
    expect(page).to have_content("Stations with the most bikes available")
    expect(page).to have_content("Bikes per station")
    expect(page).to have_content("Most recently installed station(s)")
    expect(page).to have_content("Oldest station(s)")
  end

  it "they see dashboard data and can click on stations" do
    visit('/stations-dashboard')
    click_link 'Broadway'

    expect(current_path).to eq('/stations/1')
  end

end
