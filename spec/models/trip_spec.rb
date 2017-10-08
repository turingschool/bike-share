require './app/models/trip'
require './app/models/station'
require './spec/spec_helper'


RSpec.describe 'trip model helper methods' do
    before do

    end

    it 'returns station with the most rides as a starting place' do
      expected = Trip.starting_station_with_most_rides
      expect(expected).to eq "UNKNOWN"
    end

    #
    # it 'returns station with the most rides as a ending place' do
    # expected = Trip.ending_station_with_most_rides
    # expect(expected).to eq "UNKNOWN"
    # end

    # it 'returns month by month breakdown of number of rides' do
    # expected = Trip.yearly_rides_per_month
    # expect(expected).to eq "UNKNOWN"
    # end

    # it 'returns  yearly subtotals for number of rides' do
    # expected = Trip.rides_per_year
    # expect(expected).to eq "UNKNOWN"
    # end

    # it 'returns most ridden bike' do
    # expected = Trip.top_biker
    # expect(expected).to eq "UNKNOWN"
    # end

    # it 'returns total number of rides per bike' do
    # expected = Trip.rides_per_bike
    # expect(expected).to eq "UNKNOWN"
    # end

    # it 'returns biker with fewest rides' do
    # expected = Trip.bottom_biker
    # expect(expected).to eq "UNKNOWN"
    # end

    # it 'returns user subscription type breakout with both count and percentage' do
    # expected = Trip.starting_station_with_most_rides
    # expect(expected).to eq "UNKNOWN"
    # end

    # it 'returns single date with the highest number of trips with a count of those trips' do
    # expected = Trip.starting_station_with_most_rides
    # expect(expected).to eq "UNKNOWN"
    # end

    # it 'returns single date with the lowest number of trips with a count of those trips' do
    # expected = Trip.starting_station_with_most_rides
    # expect(expected).to eq "UNKNOWN"
    # end

  end
