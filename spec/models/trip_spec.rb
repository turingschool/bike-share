require_relative '../spec_helper'

RSpec.describe Trip do
  describe "attributes" do
    it "should have duration, start_date, start_station_id, end_date, end_station_id, bike_id, subscription_type_id and zip_code_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)
      expect(trip).to respond_to(:duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type_id, :zip_code_id, :zip_code)
    end
  end

  describe "validations" do
    it "is invalid without a duration" do
      trip = Trip.new(start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do
      trip = Trip.new(duration: 63, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_date" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_type_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is valid without a zip_code_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2)

      expect(trip).to be_valid
    end
  end

  describe ".average_duration" do
    it "returns average ride duration" do
      Bike.create(bike_number: 25)
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Trip.average_duration).to eq(70)
    end
  end

  describe ".longest_trip" do
    it "returns longest trip" do
      Bike.create(bike_number: 25)
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Trip.longest_trip.duration).to eq(110)
    end
  end

  describe ".shortest_trip" do
    it "returns shortest trip" do
      Bike.create(bike_number: 25)
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Trip.shortest_trip.duration).to eq(40)
    end
  end

  describe ".name_popular_starting_station" do
    it "returns station with the most rides as a starting place" do
      Bike.create(bike_number: 25)
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 2, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Trip.name_popular_starting_station).to eq("Union Station")
    end
  end

  describe ".name_popular_ending_station" do
    it "returns station with the most rides as an ending place" do
      Bike.create(bike_number: 25)
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 2, end_date: "Wed, 09 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Trip.name_popular_ending_station).to eq("Penn Station")
    end
  end

  describe ".monthly_totals" do
    it "returns breakdown of rides by month" do
      Bike.create(bike_number: 25)
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 2, end_date: "Wed, 09 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Fri, 12 Apr 2013", start_station_id: 1, end_date: "Fri, 12 Apr 2013", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Trip.monthly_totals).to be_a(Hash)
    end
  end

  describe ".most_popular_bike" do
    it "returns bike_number of the most popular bike " do
      Bike.create(bike_number: 25)
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 2, end_date: "Wed, 09 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Trip.most_popular_bike).to eq(25)
    end
  end

  describe ".least_popular_bike" do
    it "returns bike_number of the most least bike " do
      Bike.create(bike_number: 25)
      Bike.create(bike_number: 27)
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 2, end_date: "Wed, 09 Apr 2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Trip.least_popular_bike).to eq(27)
    end
  end

   describe ".subscription_breakdown" do
    it "returns bike_number of the most least bike " do
      Bike.create(bike_number: 25)
      Bike.create(bike_number: 27)
      SubscriptionType.create(subscription_type: "Customer")
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 2, end_date: "Wed, 09 Apr 2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 2)

      result = "Customer: 66.67% (2) Subscriber: 33.33% (1)"

      expect(Trip.subscription_breakdown).to eq(result)
    end
  end

  describe ".busiest_day" do
    it "Returns a single day with the most trips and count of trips" do
      Bike.create(bike_number: 25)
      Bike.create(bike_number: 27)
      SubscriptionType.create(subscription_type: "Customer")
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 2, end_date: "Wed, 09 Apr 2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 2)

      result = "2014-04-09 - 2 trip(s)"

      expect(Trip.busiest_day).to eq(result)
    end
  end

  describe ".least_busy_day" do
    it "Returns a single day with the least trips and count of trips" do
      Bike.create(bike_number: 25)
      Bike.create(bike_number: 27)
      SubscriptionType.create(subscription_type: "Customer")
      SubscriptionType.create(subscription_type: "Subscriber")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
      City.create(name:"Mountain View")
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 2, end_date: "Wed, 09 Apr 2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 2)

      result = "2014-04-11 - 1 trip(s)"

      expect(Trip.least_busy_day).to eq(result)
    end
  end
end
