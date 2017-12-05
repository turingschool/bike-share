require 'spec_helper'

describe "When user visits '/trips/new' path" do
  before(:each) do
    @trip = Trip.create(duration: 35,
      start_date: DateTime.now,
      start_station_name: "Japan",
      start_station_id: 5,
      end_date: DateTime.now,
      end_station_name: "Narita",
      end_station_id: 7,
      bike_id: 105,
      subscription_type: "Subscriber")
  end

  it "sees Create Trip header and titled fields for trips info" do
    visit '/trips/new'

    expect(page).to have_content('Create Trip')
    expect(page).to have_content('Duration:')
    expect(page).to have_content('Start Date:')
    expect(page).to have_content('Start Station Name')
    expect(page).to have_content('Start Station ID')
    expect(page).to have_content('End Date:')
    expect(page).to have_content('End Station Name')
    expect(page).to have_content('End Station ID')
    expect(page).to have_content('Bike ID')
    expect(page).to have_content('Subscription Type:')
  end

  it "sees links back to Trip Index and Home" do
    visit '/trips/new'

    expect(page).to have_link("Home", :href=>"/")
    expect(page).to have_link("Trips", :href=>"/trips")
  end

  it "has a Submit button that will bring user back to trips index view" do
    visit '/trips/new'

    fill_in "trip[duration]", :with => 201
    fill_in "trip[subscription_type]", :with => "Customer"

    click_button("submit-button")

    expect(current_path).to have_current_path('/trips')
    expect(page).to have_content(201)
    expect(page).to have_content("Customer")
  end


end
