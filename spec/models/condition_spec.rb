require_relative '../spec_helper'

RSpec.describe Condition do
  describe "validations" do
    it "should be valid with all attributes" do
      condition = Condition.create(date: format_date("8/29/2013"),
                                   max_temperature_f: 4,
                                   mean_temperature_f: 6,
                                   min_temperature_f: 32,
                                   mean_humidity: 12,
                                   mean_visibility_miles: 1,
                                   mean_wind_speed_mph: 23,
                                   precipitation_inches: 1,
                                   zip_code: 94127
                                   )
      expect(condition).to be_valid
    end
  end
end
