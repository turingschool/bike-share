require_relative '../spec_helper'

RSpec.describe Trip do

  attr_reader :start_date, :end_date

  before do
    @start_date = DateTime.strptime('8/29/2013 14:01', '%m/%d/%Y %k:%M')
    @end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')
  end

  describe 'validations' do
    it 'is valid with a duration, start_date, end_date, subscription_type, bike_id, start_station_id, end_station_id and weather_id' do

      trip = Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)

      expect(trip).to be_valid
    end

    it 'is invalid if its missing duration' do
      trip = Trip.create(start_date: '8/29/2013 14:01', end_date: '8/29/2013 14:23', subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)

      expect(trip).to_not be_valid
    end

    it 'is invalid if its missing start date' do
      trip = Trip.create(duration: 22, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)

      expect(trip).to_not be_valid
    end

    it 'is invalid if its missing end date' do
      trip = Trip.create(duration: 22, start_date: start_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)

      expect(trip).to_not be_valid
    end

    it 'is invalid if its missing subscription_type' do
      trip = Trip.create(duration: 22, start_date: start_date, end_date: end_date, bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)

      expect(trip).to_not be_valid
    end
  end

  describe 'attributes' do
    it 'should have a duration, start_date, end_date, subscription_type, bike, start_station, end_station, weather' do

    trip = Trip.new

    expect(trip).to respond_to(:duration)
    expect(trip).to respond_to(:start_date)
    expect(trip).to respond_to(:end_date)
    expect(trip).to respond_to(:subscription_type)
    expect(trip).to respond_to(:bike)
    expect(trip).to respond_to(:start_station)
    expect(trip).to respond_to(:end_station)
    expect(trip).to respond_to(:weather)
    end
  end

  describe 'model methods' do

    it 'can make its own name, with interpolation' do
      Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
      Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
      trip = Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)

      expect(trip.make_name).to eq('8/29/2013: Start Dummy -> End Dummy')
    end
  end
end
