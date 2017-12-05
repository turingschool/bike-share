require 'spec_helper'

RSpec.describe Condition do
  describe "validations" do
    # context "invalid attributes" do
    #   it "is invalid without a date" do
    #     condition = Condition.create(max_temperature:  74.0,
    #                                 mean_temperature: 68.0,
    #                                 min_temperature:  61.0,
    #                                 mean_humidity:    75.0,
    #                                 mean_visibility:  10.0,
    #                                 mean_wind_speed:  11.0,
    #                                 precipitation:    0)
    #
    #     expect(condition).to be_invalid
    #   end
    #
    #   it "is invalid without a max temperature" do
    #     condition = Condition.create(date:            "8/29/2013",
    #                                 mean_temperature: 68.0,
    #                                 min_temperature:  61.0,
    #                                 mean_humidity:    75.0,
    #                                 mean_visibility:  10.0,
    #                                 mean_wind_speed:  11.0,
    #                                 precipitation:    0)
    #
    #     expect(condition).to be_invalid
    #   end
    #
    #   it "is invalid without a mean tempurature" do
    #     condition = Condition.create(date:            "8/29/2013",
    #                                 max_temperature:  74.0,
    #                                 min_temperature:  61.0,
    #                                 mean_humidity:    75.0,
    #                                 mean_visibility:  10.0,
    #                                 mean_wind_speed:  11.0,
    #                                 precipitation:    0)
    #
    #     expect(condition).to be_invalid
    #   end
    #
    #   it "is invalid without a min temperature" do
    #     condition = Condition.create(date:            "8/29/2013",
    #                                 max_temperature:  74.0,
    #                                 mean_temperature: 68.0,
    #                                 mean_humidity:    75.0,
    #                                 mean_visibility:  10.0,
    #                                 mean_wind_speed:  11.0,
    #                                 precipitation:    0)
    #
    #     expect(condition).to be_invalid
    #   end
    #
    #   it "is invalid without a mean humidity" do
    #     condition = Condition.create(date:            "8/29/2013",
    #                                 max_temperature:  74.0,
    #                                 mean_temperature: 68.0,
    #                                 min_temperature:  61.0,
    #                                 mean_visibility:  10.0,
    #                                 mean_wind_speed:  11.0,
    #                                 precipitation:    0)
    #
    #     expect(condition).to be_invalid
    #   end
    #
    #   it "is invalid without a mean visibility" do
    #     condition = Condition.create(date:            "8/29/2013",
    #                                 max_temperature:  74.0,
    #                                 mean_temperature: 68.0,
    #                                 min_temperature:  61.0,
    #                                 mean_humidity:    75.0,
    #                                 mean_wind_speed:  11.0,
    #                                 precipitation:    0)
    #
    #     expect(condition).to be_invalid
    #   end
    #
    #   it "is invalid without a mean wind speed" do
    #     condition = Condition.create(date:            "8/29/2013",
    #                                 max_temperature:  74.0,
    #                                 mean_temperature: 68.0,
    #                                 min_temperature:  61.0,
    #                                 mean_humidity:    75.0,
    #                                 mean_visibility:  10.0,
    #                                 precipitation:    0)
    #
    #     expect(condition).to be_invalid
    #   end
    #
    #    it "is invalid without a precipitationy" do
    #     condition = Condition.create(date:            "8/29/2013",
    #                                 max_temperature:  74.0,
    #                                 mean_temperature: 68.0,
    #                                 min_temperature:  61.0,
    #                                 mean_humidity:    75.0,
    #                                 mean_visibility:  10.0,
    #                                 mean_wind_speed:  11.0)
    #
    #     expect(condition).to be_invalid
    #   end
    #
    # end
    # context "valid attributes" do
    #   it "is valid with attributes date, max_temperature, mean_tempurature, min_temperature, mean_humidity, mean_visibility, mean_wind_speed, precipitation" do
    #     condition = Condition.create(date:            "8/29/2013",
    #                                 max_temperature:  74.0,
    #                                 mean_temperature: 68.0,
    #                                 min_temperature:  61.0,
    #                                 mean_humidity:    75.0,
    #                                 mean_visibility:  10.0,
    #                                 mean_wind_speed:  11.0,
    #                                 precipitation:    0)
    #
    #     expect(condition).to be_valid
    #   end
    # end
  end
end
