require_relative "../spec_helper"

RSpec.describe "When a user edits a station" do
  it "the station name is changed" do
    station1 = Station.create(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
    station2 = Station.create(name: "Galvanize", dock_count: 1, city: "Denver", installation_date: "4/01/1972")

    visit '/stations/2/edit'
    fill_in 'station[name]', with: 'GSchool'
    click_on 'Submit'

    expect(current_path).to eq '/stations/2'
    expect(page).to have_content 'GSchool'
    expect(page).to_not have_content 'Galvanize'
  end
end
