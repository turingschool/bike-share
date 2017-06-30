require './spec/spec_helper'

RSpec.describe Condition do
  let (:condition) {
    condition = Condition.create(
                            date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                            max_temp: 87.0,
                            mean_temp: 76.0,
                            min_temp: 54.0,
                            mean_humidity: 90.0,
                            mean_visibility: 10.0,
                            mean_wind_speed: 11.0,
                            precipitation: 0,
                            zipcode_id: 1
                          )
  }
  context "when a condition is created with all required values" do
    it "it is valid" do
      expect(condition).to be_valid
    end
  end
  context "when a condition isn't given required data it fails" do
    it "doesn't work without a #date" do
      condition = Condition.create(
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0,
                                  precipitation: 0,
                                  )
      expect(condition).to be_invalid
    end

    it "doesn't work without a #max_temp" do
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0,
                                  precipitation: 0,
                                  )
      expect(condition).to be_invalid
    end

    it "doesn't work without a #mean_temp" do
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0,
                                  precipitation: 0,
                                  )
      expect(condition).to be_invalid
    end

    it "doesn't work without a #min_temp" do
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0,
                                  precipitation: 0,
                                  )
      expect(condition).to be_invalid
    end

    it "doesn't work without a #mean_humidity" do
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0,
                                  precipitation: 0,
                                  )
      expect(condition).to be_invalid
    end

    it "doesn't work without a #humidity" do
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0,
                                  precipitation: 0,
                                  )

      expect(condition).to be_invalid
    end

    it "doesn't work without a #mean_wind_speed" do
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  precipitation: 0,
                                  )
      expect(condition).to be_invalid
    end

    it "doesn't work without a #precipitation" do
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0
                                  )
      expect(condition).to be_invalid
    end
  end

  describe ".zipcode_selected?" do
    context "when passed its zipcode id" do
      it "returns 'selected'" do
        expect(condition.zipcode_selected(1)).to eq "selected"
      end
    end

    context "when passed a different zipcode id" do
      it "returns ''" do
          expect(condition.zipcode_selected(2)).to eq ""
      end
    end
  end
  
  describe ".get_intervals_10" do
    it "returns an array" do
      expect(described_class.get_intervals_10('mean_temp').class).to be Array
    end
    before {
      Condition.create(
                      date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                      max_temp: 87.0,
                      mean_temp: 76.0,
                      min_temp: 54.0,
                      mean_humidity: 90.0,
                      mean_visibility: 10.0,
                      mean_wind_speed: 11.0,
                      precipitation: 0,
                    )
      Condition.create(
                      date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                      max_temp: 87.0,
                      mean_temp: 66.0,
                      min_temp: 54.0,
                      mean_humidity: 90.0,
                      mean_visibility: 10.0,
                      mean_wind_speed: 11.0,
                      precipitation: 0,
                    )
      Condition.create(
                      date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                      max_temp: 87.0,
                      mean_temp: 56.0,
                      min_temp: 54.0,
                      mean_humidity: 90.0,
                      mean_visibility: 10.0,
                      mean_wind_speed: 11.0,
                      precipitation: 0,
                    )
    }
    it "returns the 10 deg ranges" do
      expect(described_class.get_intervals_10('mean_temp')).to match [["70","79"], ["60","69"], ["50","59"]]
    end
  end
  describe ".get_intervals_0_50" do
    it "returns an array" do
      expect(described_class.get_intervals_0_50('precipitation').class).to be Array
    end
    before {
      zip = Zipcode.create(zipcode: "09000")
      condition = Condition.create(
                                  date: Date.strptime("08/31/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 86.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 8.0,
                                  precipitation: 0.7,
                                  zipcode_id: zip.id
                                  )
      condition_1 = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 8.0,
                                  precipitation: 1.4,
                                  zipcode_id: zip.id
                                  )
      condition_2 = Condition.create(
                                  date: Date.strptime("08/29/2013",'%m/%d/%Y'),
                                  max_temp: 82.0,
                                  mean_temp: 75.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 10.0,
                                  precipitation: 0.6,
                                  zipcode_id: zip.id
                                  )
      condition_3 = Condition.create(
                                  date: Date.strptime("08/28/2013",'%m/%d/%Y'),
                                  max_temp: 67.0,
                                  mean_temp:66.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 2.0,
                                  precipitation: 0.3,
                                  zipcode_id: zip.id
                                  )
    }
    it "returns the 10 deg ranges" do
      expect(described_class.get_intervals_0_50('precipitation')).to match [["1.00","1.49"], ["0.50","0.99"], ["0.00","0.49"]]
    end
  end

  describe '.reduce_to_modulo' do
    context "when given 5 to reduce to modulo 4" do
      it "returns 4" do
        expect(described_class.reduce_to_modulo(5,4)).to be 4
      end
    end
    context "when given 11 to reduce to modulo 4" do
      it "returns 8" do
        expect(described_class.reduce_to_modulo(11,4)).to be 8
      end
    end
  end

  describe '.increase_to_modulo' do
    context "when given 5 to increase to modulo 4" do
      it "returns 8" do
        expect(described_class.increase_to_modulo(5,4)).to be 8
      end
    end
    context "when given 11 to reduce to modulo 4" do
      it "returns 12" do
        expect(described_class.increase_to_modulo(11,4)).to be 12
      end
    end
  end

  describe ".get_intervals_4" do
    it "returns an array" do
      expect(described_class.get_intervals_4('mean_wind_speed').class).to be Array
    end
    before {
      zip = Zipcode.create(zipcode: "09000")
      condition = Condition.create(
                                  date: Date.strptime("08/31/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 86.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 7.0,
                                  precipitation: 0.7,
                                  zipcode_id: zip.id
                                  )
      condition_1 = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 8.0,
                                  precipitation: 1.4,
                                  zipcode_id: zip.id
                                  )
      condition_2 = Condition.create(
                                  date: Date.strptime("08/29/2013",'%m/%d/%Y'),
                                  max_temp: 82.0,
                                  mean_temp: 75.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 10.0,
                                  precipitation: 0.6,
                                  zipcode_id: zip.id
                                  )
      condition_3 = Condition.create(
                                  date: Date.strptime("08/28/2013",'%m/%d/%Y'),
                                  max_temp: 67.0,
                                  mean_temp:66.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 2.0,
                                  precipitation: 0.3,
                                  zipcode_id: zip.id
                                  )
    }
    it "returns the 4 mph ranges" do
      expect(described_class.get_intervals_4('mean_wind_speed')).to match [[8,11], [4,7], [0,3]]
    end
  end

  describe "getting trip stats" do
    before {
      city_1 = City.create(name: "squeevillia")
      station = Station.create!(
                    name: "something",
                    dock_count: 1,
                    city_id: city_1.id,
                    installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                    longitude: -121.9,
                    latitude: 30.7
      )
      Trip.create(
                    duration: 60,
                    start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                    start_station_id: station.id,
                    end_date: DateTime.strptime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                    end_station_id: station.id,
                    bike_id: 1,
                    subscription_type: "Subscriber"
      )
      Trip.create(
                    duration: 60,
                    start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                    start_station_id: station.id,
                    end_date: DateTime.strptime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                    end_station_id: station.id,
                    bike_id: 1,
                    subscription_type: "Subscriber"
      )
      Trip.create(
                    duration: 60,
                    start_date: DateTime.strptime("08/29/2013 11:11", "%m/%d/%Y %H:%M"),
                    start_station_id: station.id,
                    end_date: DateTime.strptime("08/29/2013 11:12", "%m/%d/%Y %H:%M"),
                    end_station_id: station.id,
                    bike_id: 1,
                    subscription_type: "Subscriber"
      )
      Trip.create(
                    duration: 60,
                    start_date: DateTime.strptime("08/28/2013 11:11", "%m/%d/%Y %H:%M"),
                    start_station_id: station.id,
                    end_date: DateTime.strptime("08/28/2013 11:12", "%m/%d/%Y %H:%M"),
                    end_station_id: station.id,
                    bike_id: 1,
                    subscription_type: "Subscriber"
      )
      Trip.create(
                    duration: 60,
                    start_date: DateTime.strptime("08/28/2013 11:11", "%m/%d/%Y %H:%M"),
                    start_station_id: station.id,
                    end_date: DateTime.strptime("08/28/2013 11:12", "%m/%d/%Y %H:%M"),
                    end_station_id: station.id,
                    bike_id: 1,
                    subscription_type: "Subscriber"
      )
      Trip.create(
                    duration: 60,
                    start_date: DateTime.strptime("08/31/2013 11:11", "%m/%d/%Y %H:%M"),
                    start_station_id: station.id,
                    end_date: DateTime.strptime("08/31/2013 11:12", "%m/%d/%Y %H:%M"),
                    end_station_id: station.id,
                    bike_id: 1,
                    subscription_type: "Subscriber"
      )
      Trip.create(
                    duration: 60,
                    start_date: DateTime.strptime("08/28/2013 11:11", "%m/%d/%Y %H:%M"),
                    start_station_id: station.id,
                    end_date: DateTime.strptime("08/28/2013 11:12", "%m/%d/%Y %H:%M"),
                    end_station_id: station.id,
                    bike_id: 1,
                    subscription_type: "Subscriber"
      )
      zip = Zipcode.create(zipcode: "09000")

      condition_1 = Condition.create(
                                  date: Date.strptime("08/31/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 57.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 1.2,
                                  mean_wind_speed: 11.0,
                                  precipitation: 1.0,
                                  )
      condition_2 = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 66.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 3.4,
                                  mean_wind_speed: 5.6,
                                  precipitation: 0.25,
                                  )
      condition_3 = Condition.create(
                                  date: Date.strptime("08/29/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 56.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 2.0,
                                  mean_wind_speed: 1.0,
                                  precipitation: 0,
                                  )
    }
    it "can determine a date range for mean temp" do
      expect(Condition.determine_date_range(:mean_temp, 50.0, 59.0).count).to eq(2)
      expect(Condition.determine_date_range(:mean_temp, 60.0, 69.0).count).to eq(1)
    end

    it "can determine the average rides by mean temp" do
      expect(Condition.ave_rides_per_condition(:mean_temp, 50.0, 59.0)).to eq(1.0)
      expect(Condition.ave_rides_per_condition(:mean_temp, 60.0, 69.0)).to eq(2.0)
    end

    it "can determine the most rides by mean temp" do
      expect(Condition.most_rides_per_condition(:mean_temp, 50.0, 59.0)).to eq(1)
      expect(Condition.most_rides_per_condition(:mean_temp, 60.0, 69.0)).to eq(2)
    end

    it "can determine the fewest rides by mean temp" do
      expect(Condition.fewest_rides_per_condition(:mean_temp, 50.0, 59.0)).to eq(1)
      expect(Condition.fewest_rides_per_condition(:mean_temp, 60.0, 69.0)).to eq(2)
    end

    it "can determine a date range for precipitation" do
      expect(Condition.determine_date_range(:precipitation, 0.0, 0.5).count).to eq(2)
      expect(Condition.determine_date_range(:precipitation, 1.0, 1.5).count).to eq(1)
    end

    it "can determine the average rides by precipitation" do
      expect(Condition.ave_rides_per_condition(:precipitation, 0.0, 0.5)).to eq(1.5)
      expect(Condition.ave_rides_per_condition(:precipitation, 1.0, 1.5)).to eq(1.0)
    end

    it "can determine the most rides by precipitation" do
      expect(Condition.most_rides_per_condition(:precipitation, 0.0, 0.5)).to eq(2)
      expect(Condition.most_rides_per_condition(:precipitation, 1.0, 1.5)).to eq(1)
    end

    it "can determine the fewest rides by precipitation" do
      expect(Condition.fewest_rides_per_condition(:precipitation, 0.0, 0.5)).to eq(1)
      expect(Condition.fewest_rides_per_condition(:precipitation, 1.0, 1.5)).to eq(1)
    end

    it "can determine a date range for wind speed" do
      expect(Condition.determine_date_range(:mean_wind_speed, 0, 4).count).to eq(1)
      expect(Condition.determine_date_range(:mean_wind_speed, 5, 8).count).to eq(1)
      expect(Condition.determine_date_range(:mean_wind_speed, 9, 12).count).to eq(1)
    end

    it "can determine the average rides by wind speed" do
      expect(Condition.ave_rides_per_condition(:mean_wind_speed, 0, 4)).to eq(1.0)
      expect(Condition.ave_rides_per_condition(:mean_wind_speed, 5, 8)).to eq(2.0)
      expect(Condition.ave_rides_per_condition(:mean_wind_speed, 9, 12)).to eq(1.0)
    end

    it "can determine the most rides by wind speed" do
      expect(Condition.most_rides_per_condition(:mean_wind_speed, 0, 4)).to eq(1)
      expect(Condition.most_rides_per_condition(:mean_wind_speed, 5, 8)).to eq(2)
      expect(Condition.most_rides_per_condition(:mean_wind_speed, 9, 12)).to eq(1)
    end

    it "can determine the fewest rides by wind speed" do
      expect(Condition.fewest_rides_per_condition(:mean_wind_speed, 0, 4)).to eq(1)
      expect(Condition.fewest_rides_per_condition(:mean_wind_speed, 5, 8)).to eq(2)
      expect(Condition.fewest_rides_per_condition(:mean_wind_speed, 9, 12)).to eq(1)
    end

    it "can determine a date range for visibility" do
      expect(Condition.determine_date_range(:mean_visibility, 0, 4).count).to eq(3)
    end

    it "can determine the average rides by visibility" do
      expect(Condition.ave_rides_per_condition(:mean_visibility, 0, 4)).to eq(1.33)
    end

    it "can determine the most rides by visibility" do
      expect(Condition.most_rides_per_condition(:mean_visibility, 0, 4)).to eq(2)
    end

    it "can determine the fewest rides by visibility" do
      expect(Condition.fewest_rides_per_condition(:mean_visibility, 0, 4)).to eq(1)
    end

  end
end
