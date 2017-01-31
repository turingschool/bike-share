require_relative '../spec_helper'

RSpec.describe Condition do

  describe 'validations' do
    it "is valid with valid parameters" do
      condition = Condition.new(date: 9/2/2013,
                                max_temperature_f: 78,
                                mean_temperature_f: 73,
                                min_temperature_f: 67,
                                mean_humidity: 43,
                                mean_visibility_miles: 11,
                                mean_wind_speed_mph: 12,
                                precipitation_inches: 0)
      expect(condition).to be_valid
    end

    it "validates presence of date" do
      condition = Condition.new(max_temperature_f: 78,
                                mean_temperature_f: 73,
                                min_temperature_f: 67,
                                mean_humidity: 43,
                                mean_visibility_miles: 11,
                                mean_wind_speed_mph: 12,
                                precipitation_inches: 0)
      expect(condition).to_not be_valid
    end
  end
  
end
