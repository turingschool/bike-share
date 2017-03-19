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

      station = Station.create(long: -121.90178200000001, name: 'Cat Station', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))

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

    it 'is invalid if its missing a city' do
      city = City.create(name: 'Denver')

      station = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', dock_count: 12, installation_date: Date.parse('8/6/2013'))

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
end
