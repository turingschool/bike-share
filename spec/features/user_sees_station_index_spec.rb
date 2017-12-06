require 'spec_helper'

describe 'as a user when I visit stations index' do
  before :each do
    @station_1 = Station.create(name: "SF", dock_count: 5,
    city: "San Francisco", installation_date: "2013-08-23")
    @station_2 = Station.create(name: "CO", dock_count: 4, city: "Denver",
    installation_date: "2013-08-14")
    @station_3 = Station.create(name: "WI", dock_count: 3, city: "Madison",
    installation_date: "2013-08-06")

    visit '/stations/index'
  end

  it 'I expect to see details of station 1' do
    expect(page.status_code).to eq(200)

    expect(page).to have_content(5)
    expect(page).to have_content("SF")
    expect(page).to have_content("San Francisco")
    expect(page).to have_content("2013-08-23")
  end

  it 'I expect to see details of station 2' do
    expect(page).to have_content(4)
    expect(page).to have_content("CO")
    expect(page).to have_content("Denver")
    expect(page).to have_content("2013-08-14")
  end

  it 'I expect to see details of station 3' do
    expect(page).to have_content(3)
    expect(page).to have_content("WI")
    expect(page).to have_content("Madison")
    expect(page).to have_content("2013-08-06")
  end

  it 'I click the name of a station and be directed to the station show page' do
    click_link("SF")

    expect(current_path).to eq("/stations/#{@station_1.id}")
  end

  it "I can see a delete button and when I click it, it erases and returns to index" do
    first(".delete").click

    expect(current_path).to eq("/stations/index")
  end

  it "I expect to be able to edit a station" do
    first(".edit").click

    expect(current_path).to eq('/stations/1/edit')
  end
end
