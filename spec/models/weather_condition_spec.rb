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
  end

  # describe "attributes" do
  #   it "should have a name" do
  #     city = City.new
  #
  #     expect(city).to respond_to(:name)
  #   end
  # end
end
