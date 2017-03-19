require_relative '../spec_helper'

RSpec.describe "When a user needs to edit/update a bike station" do


  it "it populates the fields from our station/edit" do

    city = City.create(name: 'Denver')

    station = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', dock_count: 12, city_id: 1, installation_date: Date.parse("8/6/2013"))

    visit "/stations/#{station.id}"

    click_on 'Edit'

    expect(page).to have_selector("input[value= 'Turing Station']")
    expect(page).to have_selector("input[value= 'Denver']")
    expect(page).to have_selector("input[value='12']")
    expect(page).to have_selector("input[value= '#{Date.parse('8/6/2013')}']")

    fill_in "station[name]", with: "Beavis Station"
    fill_in "station[city]", with: "Thornton"
    fill_in "station[dock_count]", with: 8
    fill_in "station[installation_date]", with: Date.parse('29/10/1986')

    click_on "Submit"

    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content('Beavis Station')
    expect(page).to have_content('Thornton')
    expect(page).to have_content(8)
    expect(page).to have_content("#{(Date.parse('29/10/1986'))}")
  end
end
