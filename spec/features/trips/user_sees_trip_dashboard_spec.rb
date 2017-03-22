require_relative "../../spec_helper"

RSpec.describe "When a user visits '/trip-dashboard' " do
  before :each do
    city = City.create(name: "Denver")
    @station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "14/3/2017")
    @station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "1/4/1972")
    @bike1 = Bike.create(bike_number: 33)
    @bike2 = Bike.create(bike_number: 44)
    subscription_type1 = SubscriptionType.create(subscription_type: "Subscriber")
    subscription_type2 = SubscriptionType.create(subscription_type: "Customer")
    zip_code = ZipCode.create(zip_code: 80602)
    @trip1 = Trip.create(duration: 100, start_date: "29/8/2013 14:14", start_station_id: @station1.id, end_date: "29/8/2013 20:14", end_station_id: @station2.id, bike_id: @bike1.id, subscription_type_id: subscription_type1.id, zip_code_id: zip_code.id)
    @trip2 = Trip.create(duration: 200, start_date: "29/8/2013 14:14", start_station_id: @station1.id, end_date: "29/8/2013 20:14", end_station_id: @station1.id, bike_id: @bike2.id, subscription_type_id: subscription_type2.id, zip_code_id: zip_code.id)
    @trip3 = Trip.create(duration: 300, start_date: "29/10/2014 14:14", start_station_id: @station2.id, end_date: "29/8/2013 20:14", end_station_id: @station2.id, bike_id: @bike2.id, subscription_type_id: subscription_type2.id, zip_code_id: zip_code.id)
  end
  it "they see a dashboard message" do
    visit '/trip-dashboard'

    within('h1') do
      expect(page).to have_content('Welcome to the Trips Dashboard!')
    end

    within('div.average_duration') do
      expect(page).to have_content('Average duration of a ride: 3 minutes')
    end

    within('div.longest_ride') do
      expect(page).to have_content('Longest Ride: 5 minutes')
    end

    within('div.shortest_ride') do
      expect(page).to have_content('Shortest Ride: 1 minute')
    end

    within('div.start_station_with_most_rides') do
      expect(page).to have_content('Station with the most rides as a starting place: Turing')
    end

    within('div.end_station_with_most_rides') do
      expect(page).to have_content('Station with the most rides as a ending place: Galvanize')
    end

    within('div.most_ridden_bike') do
      expect(page).to have_content('Most ridden bike: Number 44')
      expect(page).to have_content('Total number of rides: 2')
    end

    within('div.least_ridden_bike') do
      expect(page).to have_content('Least ridden bike: Number 33')
      expect(page).to have_content('Total number of rides: 1')
    end

    within('div.total_and_percent_customers') do
      expect(page).to have_content('Total Customers: 2')
      expect(page).to have_content('Percent Customers: 66.67%')
    end

    within('div.total_and_percent_subscribers') do
      expect(page).to have_content('Total Subscribers: 1')
      expect(page).to have_content('Percent Subscribers: 33.33%')
    end

    within('div.date_with_most_trips') do
      expect(page).to have_content('Date with most trips: Thursday, August 29, 2013')
    end

    within('div.date_with_least_trips') do
      expect(page).to have_content('Date with least trips: Wednesday, October 29, 2014')
    end


  end
end
