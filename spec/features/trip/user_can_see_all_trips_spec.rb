require_relative "../../spec_helper"

RSpec.describe "when a user visits '/trips' " do

# show only 30 records per page limit(30) offset by 30 each page
# module pagination

  it "they see welcome message" do
    visit "/trips"
    # expect(page).to eq("/trips/page/1")
    expect(page).to have_content("All Trips")
  end

  it "they can see 30 trips" do
    visit "/trips"


    expect(current_path).to eq("/trips")


    expect(page).to have_content("All Trips")
    expect(page).to have_content("Duration")
    expect(page).to have_content("Start Date")
    expect(page).to have_content("Start Station")
    expect(page).to have_content("End Date")
    expect(page).to have_content("End Station")
    expect(page).to have_content("Bike ID")
    expect(page).to have_content("Subscription Type")
    expect(page).to have_content("Zipcode")
  end

  it "and sees 30 trips on each page" do

    city = City.create(city: "Denver")
    start_station = Station.create(name: "Denver", dock_count: 15, city_id: 1, installation_date: "12/05/1987")
    end_station = Station.create(name: "Boulder", dock_count: 14, city_id: 2, installation_date: "12/05/1987")
    zipcode = Zipcode.create(zip_code: 94062)
    subscription = Subscription.create(subscription: "Customer")

    (30..91).each do |n|
      trip = Trip.create(duration: 123, start_date: "12/05/1987",
                                       start_station: start_station, end_date: "12/05/19#{n}",
                                       end_station: end_station, bike_id: 1,
                                       subscription_id: 1, zipcode_id: 1)
    end

    visit('/trips')

    expect(page).to have_content("1930")
    expect(page).to have_content("1959")
    expect(page).to_not have_content("1960")
    expect(page).to_not have_content("1989")

    click_on("Next")

    expect(page).to have_content("1960")
    expect(page).to have_content("1989")
    expect(page).to_not have_content("1930")
    expect(page).to_not have_content("1959")
    expect(current_path).to eq('/trips')

    click_on("Previous")

    expect(page).to have_content("1930")
    expect(page).to have_content("1959")
    expect(page).to_not have_content("1960")
    expect(page).to_not have_content("1989")
    expect(current_path).to eq('/trips')

  end
end
