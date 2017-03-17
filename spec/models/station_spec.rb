require 'Date'
require_relative '../spec_helper'

Rspec.describe Station do
  describe 'validations' do

    it 'is valid with a name, dock count, city and installation date' do
      station = Station.create(name: 'Turing Station', dock_count: 12, city: 'Denver', installation_date: Date.new('8/6/2013'))

      expect(station).to be_valid
    end

    it 'is invalid if its missing a name' do
      station = Station.create( dock_count: 12, city: 'Denver', installation_date: Date.new('8/6/2013'))

      expect(station).to_not be_valid
    end

    it 'is invalid if its missing a dock count' do
      station = Station.create(name: 'Turing Station', city: 'Denver', installation_date: Date.new('8/6/2013'))

      expect(station).to_not be_valid
    end

    it 'is invalid if its missing a city' do
      station = Station.create(name: 'Turing Station', dock_count: 12, installation_date: Date.new('8/6/2013'))

      expect(station).to_not be_valid
    end

    it 'is invalid if its missing a installation date' do
      station = Station.create(name: 'Turing Station', dock_count: 12, city: 'Denver')

      expect(station).to_not be_valid
    end

  end

  describe 'atributes' do
    it 'should have a name, dock count, city and installation date' do
      station = Station.new

      expect(station).to respond_to(:name)
      expect(station).to respond_to(:dock_count)
      expect(station).to respond_to(:city)
      expect(station).to respond_to(:installation_date)
    end
  end
end
