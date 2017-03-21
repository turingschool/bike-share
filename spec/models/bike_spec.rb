require_relative '../spec_helper'

RSpec.describe Bike do

  def format_date(date)
    fd = date.split(/[\/: ]/)
    Time.local(fd[2], fd[0], fd[1], fd[3], fd[4])
  end

  before :each do
    Bike.create(bike_number: 202)
    Bike.create(bike_number: 203)
    Trip.create(duration: 39,
                 start_date: format_date("12/15/2013 14:54"),
                 start_station_id: 4,
                 end_date: format_date("12/15/2013 15:56"),
                 bike_id: 1,
                 end_station_id: 32,
                 subscription_type: "Subscriber"
                 )
     Trip.create(duration: 45,
                 start_date: format_date("11/15/2013 14:54"),
                 start_station_id: 7,
                 end_date: format_date("11/15/2013 15:56"),
                 bike_id: 2,
                 end_station_id: 32,
                 subscription_type: "Subscriber"
                 )
     Trip.create(duration: 45,
                 start_date: format_date("11/15/2013 14:54"),
                 start_station_id: 7,
                 end_date: format_date("11/15/2013 15:56"),
                 bike_id: 2,
                 end_station_id: 7,
                 subscription_type: "Subscriber"
                 )
  end

  describe "attributes" do
    it "should have bike number" do
      expect(Bike.first.bike_number).to eq(202)
    end

    it "should know about trips" do
      expect(Bike.first.trips.first).to respond_to(:duration)
      expect(Bike.first.trips.first.end_station_id).to eq(32)
    end
  end

  describe "ride count methods" do
    it "#max_rides should return bike_number 203" do
      expect(Bike.max_rides).to eq([203])
    end

    it "#min_rides should return bike_number 202" do
      expect(Bike.min_rides).to eq([202])
    end

    

  end
end
