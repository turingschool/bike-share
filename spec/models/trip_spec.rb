require_relative '../spec_helper'


def format_date(date)
  fd = date.split(/[\/: ]/)
  Time.local(fd[2], fd[0], fd[1], fd[3], fd[4])
end

RSpec.describe Trip do
  describe "validations" do
    it "should be valid with all attributes except zip_code" do
      trip = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         start_station_name: "North station",
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_name: "South station",
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to be_valid
    end

    it "should be invalid without duration" do
      trip = Trip.create(start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         start_station_name: "North station",
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_name: "South station",
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without start_date" do
      trip = Trip.create(duration: 39,
                         start_station_id: 4,
                         start_station_name: "North station",
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_name: "South station",
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without start_station_name" do
      trip = Trip.create(duration: 39,
                         start_station_id: 4,
                         start_date: format_date("12/15/2013 14:54"),
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_name: "South station",
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without end_date" do
      trip = Trip.create(duration: 39,
                         start_station_id: 4,
                         start_station_name: "North station",
                         start_date: format_date("12/15/2013 14:54"),
                         bike_id: 6,
                         end_station_name: "South station",
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without bike_id" do
      trip = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         start_station_name: "North station",
                         end_date: format_date("12/15/2013 15:56"),
                         end_station_name: "South station",
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end
    it "should be invalid without end_station_name" do
      trip = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         start_station_name: "North station",
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without subscription_type" do
      trip = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         start_station_name: "North station",
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                          end_station_name: "South station"
                         )
      expect(trip).to_not be_valid
    end
  end
end
