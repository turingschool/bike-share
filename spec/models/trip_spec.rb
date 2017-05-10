require './spec/spec_helper'


RSpec.describe Trip do
  describe "trip can return all attributes" do
    it "has all attributes" do
      zipcode = Zipcode.create(zipcode: 94127)
      station = Station.create(
                      dock_count: 1, 
                      city_id: 1, 
                      installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), 
                      longitude: -121.9, 
                      latitude: 30.7)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )

      expect(trip.id).to eq 1
      expect(trip.duration).to eq 240
      expect(trip.start_date).to eq DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M")
      expect(trip.start_station_id).to eq 1
      expect(trip.end_date).to eq DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M")
      expect(trip.end_station_id).to eq 1
      expect(trip.bike_id).to eq 5
      expect(trip.subscription_type).to eq "Subscriber"
      expect(trip.zipcode_id).to eq 1
    end
  end

  describe "trip requires all necessary fields" do
    it "is invalid without a duration" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without a start date" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without a start station id" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without an end date" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without end station id" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without a bike id" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without a subscription type" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      bike_id: 5,
                      end_station_id: 1,
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end
  end

  # describe "station can calculate dashboard information" do
  #   before {
  #     Station.create(name: "something", dock_count: 1, city_id: 1, installation_date: Date.strptime("08/30/2015",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)
  #     Station.create(name: "else", dock_count: 2, city_id: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)
  #     Station.create(name: "other", dock_count: 3, city_id: 1, installation_date: Date.strptime("08/30/2014",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)
  #     Station.create(name: "and again", dock_count: 4, city_id: 1, installation_date: Date.strptime("08/30/2014",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)
  #   }
  #   it "can calculate the average number of bikes for all stations" do
  #     expect(Station.average_bikes).to eq(2.5)
  #   end

  #   it "can calculate the most bikes at any stations" do
  #     expect(Station.most_bikes_count).to eq(4)
  #   end

  #   it "can calculate which stations have the most bikes" do
  #     expect(Station.most_bikes_avail_at).to eq('and again')
  #   end

  #   it "can calculate the fewest bikes at any stations" do
  #     expect(Station.fewest_bikes_count).to eq(1)
  #   end

  #   it "can calculate which stations have the fewest bikes" do
  #     expect(Station.fewest_bikes_avail_at).to eq('something')
  #   end

  #   it "can find the oldest station created" do
  #     expect(Station.oldest_station).to eq('else')
  #   end

  #   it "can find the newewst station created" do
  #     expect(Station.newest_station).to eq('something')
  #   end
  # end

end