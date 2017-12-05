require 'spec_helper'

describe "when a visitor visits the trips index" do
  it "sees a descriptive explanation message" do
    visit '/trips'

    expect(page).to have_content("Trip details")
  end

  it "can click the link to create a new trip" do
    visit '/trips'
    click_link('Create new trip')

    expect(page).to have_current_path("/trips/new")
    expect(page).to have_content("Make a new trip")
  end

  it "clicks the name of the trip to display its information" do
    date = DateTime.new(5-14-2010)
    Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)
    visit '/trips'
    # binding.pry
    click_link('View')

    expect(page).to have_content("5")
    expect(page).to have_current_path("/trips/1")
  end

  it "clicks the edit link to edit trip information" do
    date = DateTime.new(5-14-2010)
    Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)
       visit '/trips'
    click_link('Edit')

    expect(page).to have_content("Edit your trip")
    expect(page).to have_current_path("/trips/1/edit")
  end

  it "clicks the delete button which deletes trip and redirects to index" do
    date = DateTime.new(5-14-2010)
    Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)
     visit '/trips'
    click_on('Delete')

    expect(page).to have_content("Trip details")
    expect(Trip.count).to eq(0)
  end


end