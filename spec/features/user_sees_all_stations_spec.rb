require './spec/spec_helper'

RSpec.describe "user visits stations index" do
  it 'shows all stations' do
    Station.create(name: 'Lodo', city_id: 1, dock_count: "56", date_id: "17")

    visit('/stations')

    save_and_open_page

    expect(page).to have_content("Stations")
    expect(page).to have_content("Lodo")
    expect(page).to have_content("56")
    expect(page).to have_content("17")
    expect(page).to have_content("1")
  end

end