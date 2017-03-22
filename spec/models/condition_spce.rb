require_relative '../spec_helper'

RSpec.describe Condition do
  describe "attributes" do
    it "should respond to date, max_temp, mean_temp, min_temp, mean_humidity, mean_visibility, mean_wind and precipitation" do
      condition = Condition.create(date: "8/29/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)

      expect(condition).to respond_to(:date, :max_temp, :mean_temp, :min_temp, :mean_humidity, :mean_visibility, :mean_wind, :precipitation)
    end
  end
end