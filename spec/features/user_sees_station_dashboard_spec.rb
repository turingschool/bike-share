require 'spec_helper'

describe 'As a user' do
  describe 'when i visit /station-dashboard' do
    before :each do
      @station_1 = Station.create(name: "SF", dock_count: 5,
      city: "San Francisco", installation_date: "2013-08-23")
      @station_2 = Station.create(name: "CO", dock_count: 4, city: "Denver",
      installation_date: "2013-08-14")
      @station_3 = Station.create(name: "WI", dock_count: 3, city: "Madison",
      installation_date: "2013-08-06")
      @station_4 = Station.create(name: "The Bay", dock_count: 25, city: "San Francisco", installation_date: "2013-08-14")
    end

    it 'I see the total count of all stations' do

    end

    it 'I see Average bikes available per station based on docks' do

    end

    it 'I see most bikes available at a station based on docks' do

    end

    it 'I see Station(s) where the most bikes are available (based on docks).' do

    end

    it 'I see Fewest bikes available at a station (based on docks).' do

    end

    it 'I see Station(s) where the fewest bikes are available (based on docks).' do

    end

    it 'I see most recently installed Station' do

    end

    it "I see oldest station" do

    end
  end
end
