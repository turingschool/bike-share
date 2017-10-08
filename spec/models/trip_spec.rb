require './app/models/trip'
require './spec/spec_helper'

dummy_data = {
    Trip => {
        duration: 8,
        start_date: "1989-01-01",
        start_station: 4,
        end_date: "2001-01-01",
        end_station: 47,
        bike_id: 404,
        subscription_type: "Yearly",
        zip_code: 80202
            }
            }

RSpec.describe 'trip model helper methods' do
    before do 
        Trip.create({duration: 8, start_date: "1989-01-01", start_station: 4, end_date: "2001-01-01", end_station: 47, bike_id: 404, subscription_type: "Yearly", zip_code: 80202})
        Trip.create({duration: 6, start_date: "1999-01-01", start_station: 2, end_date: "2000-01-01", end_station: 67, bike_id: 94, subscription_type: "Monthly", zip_code: 90702})
        Trip.create({duration: 6, start_date: "1999-01-01", start_station: 2, end_date: "2000-01-01", end_station: 67, bike_id: 94, subscription_type: "Monthly", zip_code: 90702})        
    end
    
    it 'returns station with the most rides as a starting place' do
        expected = Trip.starting_station_with_most_rides
        expect(expected).to eq 2
    end

    #station.find_by(max start station )

    it 'returns station with the most rides as a ending place' do
        
    end

    it 'returns month by month breakdown of number of rides with subtotals for each year' do
        
    end

    it 'returns most ridden bike with total number of rides for that bike' do
        
    end

    it 'returns least ridden bike with total number of rides for that bike' do
        
    end

    it 'returns user subscription type breakout with both count and percentage' do
        
    end

    it 'returns single date with the highest number of trips with a count of those trips' do
        
    end

    it 'returns single date with the lowest number of trips with a count of those trips' do
        
    end



# Average duration of a ride.
# Longest ride.
# Shortest ride.