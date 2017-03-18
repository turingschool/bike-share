require_relative "../spec_helper"

RSpec.describe "When a user deletes a station" do
  it "the station no longer exists" do
    city = City.create(name: "Denver")
    station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "3/14/2017")
    station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "4/01/1972")

    visit '/stations/2'

    click_on 'Delete Station'
    expect(current_path).to eq '/stations'
    expect(Station.all.count).to eq 1
    # expect(Station.find(2)).to be false
  end
end
