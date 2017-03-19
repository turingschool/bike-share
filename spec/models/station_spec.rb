require 'Date'
require_relative '../spec_helper'

RSpec.describe Station do
  describe 'validations' do

    it 'is valid with a name, dock count, city, longitude, latitude and installation date' do
      city = City.create(name: 'Denver')

      station = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', dock_count: 12, city_id: city.id, installation_date:  Date.parse('8/6/2013'))

      expect(station).to be_valid
    end

    it 'is invalid if its missing a latitude' do
      city = City.create(name: 'Denver')

      station = city.stations.create(long: -121.90178200000001, name: 'Cat Station', dock_count: 12, installation_date: Date.parse('8/6/2013'))

      expect(station).to_not be_valid
    end

    it 'is invalid if its missing a longitude' do
      city = City.create(name: 'Denver')

      station = Station.create(lat: 37.329732, name: 'We\'re cool!', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))

      expect(station).to_not be_valid
    end

    it 'is invalid if its missing a name' do
      city = City.create(name: 'Denver')

      station = Station.create(lat: 37.329732, long: -121.90178200000001,  dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))

      expect(station).to_not be_valid
    end

    it 'is invalid if its missing a dock count' do
      city = City.create(name: 'Denver')

      station = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', city_id: 1, installation_date: Date.parse('8/6/2013'))

      expect(station).to_not be_valid
    end

    it 'is invalid if its missing a installation date' do
      city = City.create(name: 'Denver')

      station = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', dock_count: 12, city_id: 1)

      expect(station).to_not be_valid
    end

  end

  describe 'attributes' do
    it 'should have a name, dock count, city and installation date' do
      station = Station.new

      expect(station).to respond_to(:name)
      expect(station).to respond_to(:dock_count)
      expect(station).to respond_to(:city)
      expect(station).to respond_to(:installation_date)
    end
  end

  describe 'dashboard methods' do

    before do
      city = City.create(name: 'Denver')

      city.stations.create!(lat: 37.329732, long: -121.90178200000001, name: 'Beth\'s Station', dock_count: 12, installation_date: Date.parse('8/8/2016'))
      city.stations.create!(lat: 2, long: 1, name: 'Sam\'s Station', dock_count: 2, installation_date: Date.parse('12/10/1986'))
      city.stations.create!(lat: 2, long: 1, name: 'Chris\' Station', dock_count: 12, installation_date: Date.parse('8/8/2016'))
      city.stations.create!(lat: 2, long: 1, name: 'Mark\'s Station', dock_count: 2, installation_date: Date.parse('8/8/2016'))
    end

    it 'shows the total stations' do
      count = Station.total

      expect(count).to eq(4)
    end

    it 'shows the average number of docks per station' do
      average = Station.find_average_docks

      expect(average).to eq(7)
    end

    it 'shows the highest number of docks at a station' do
      max_docks = Station.max_dock_count

      expect(max_docks).to eq(12)
    end

    it 'shows the station(s) with the highest number of docks' do
      station_max_docks = Station.stations_with_most_docks
      stations = [Station.find(1), Station.find(3)]

      expect(station_max_docks).to eq(stations)
    end

    it 'shows the fewest number of docks at a station' do
      min_docks = Station.min_dock_count

      expect(min_docks).to eq(2)
    end

    it 'shows the station(s) with the fewest number of docks' do

      station_min_docks = Station.stations_with_fewest_docks
      stations = [Station.find(2), Station.find(4)]

      expect(station_min_docks).to eq(stations)
    end

    it 'shows the first installed station' do
      youngest = Station.oldest_station
      sam = [Station.find(2)]

      expect(youngest).to eq(sam)
    end

    it 'shows the first installed station' do
      oldest = Station.oldest_station

    end
  end
end