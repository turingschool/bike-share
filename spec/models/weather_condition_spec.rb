require_relative '../spec_helper'

RSpec.describe WeatherCondition do

  before do
    @weather = WeatherCondition.create(max_temperature_f: 99.0, min_temperature_f: -121.9, mean_temperature_f: 55.0, mean_humidity: 62.5, mean_visibility_miles: 0.2, mean_wind_speed_mph: 20.0, precipitation_inches: 1.2, date: Date.parse('29/10/1986'))
  end

  describe "validations" do
    it "is valid with a precipitation value" do

      expect(@weather).to be_valid
    end

    it "is invalid without a precip" do
    condition = WeatherCondition.create(precipitation_inches: '')

    expect(condition).to_not be_valid
    end

    it "is valid with a max temperature value" do

      expect(@weather).to be_valid
    end

    it "is invalid with a max temperature value" do
    condition = WeatherCondition.create(max_temperature_f: '')

    expect(condition).to_not be_valid
    end

    it "is valid with a min temperature value" do
      expect(@weather).to be_valid
    end

    it "is invalid without a min temperature value" do
      condition = WeatherCondition.create(min_temperature_f: '')

      expect(condition).to_not be_valid
    end

    it "is valid with mean temperature" do
      expect(@weather).to be_valid
    end

    it "is invalid without a mean temperature" do
      condition = WeatherCondition.create(mean_temperature_f: '')

      expect(condition).to_not be_valid
    end

    it "is valid with a mean humidity" do
      expect(@weather).to be_valid

    end

    it "is invalid without a mean humidity" do

    condition = WeatherCondition.create(mean_humidity: '')

    expect(condition).to_not be_valid
  end

      it "is valid with mean visibility miles" do
      expect(@weather).to be_valid
    end

  it "is invalid without the mean visbility miles" do
    condition = WeatherCondition.create(mean_humidity: '')

    expect(condition).to_not be_valid
  end

    it "is valid with mean wind speed MPH" do
      expect(@weather).to be_valid
  end

    it "is invalid with mean wind speed MPH" do

    condition = WeatherCondition.create(precipitation_inches: '')
    expect(condition).to_not be_valid
    end

    it "is valid with precipitation inches" do
      expect(@weather).to be_valid
    end

    it "is invalid with precipitation inches" do
      condition = WeatherCondition.create(precipitation_inches: '')

      expect(condition).to_not be_valid
    end

    it "is valid with a date" do
      expect(@weather).to be_valid
    end
    it "is invalid without a date" do
      condition = WeatherCondition.create(date: '')

      expect(condition).to_not be_valid
    end
  end

  # describe ".total " do
  #   expect(@weather.total)
  # end

  describe "relationships between trips and weather" do
    it "every weather has many trips" do

      start_date = DateTime.strptime('8/29/2000 14:01', '%m/%d/%Y %k:%M')
      end_date = DateTime.strptime('8/29/2000 14:23', '%m/%d/%Y %k:%M')

      trip1 = Trip.create(duration: 23, start_date: start_date, end_date: end_date, subscription_type: 'subscriber')
      trip2 = Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber')

      # require "pry"; binding.pry
      @weather.trips << trip1
      @weather.trips << trip2

      expect(@weather.trips).to include(trip1)
      expect(@weather.trips).to include(trip2)
    end
  end



end
