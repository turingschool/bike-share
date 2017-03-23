require_relative "../spec_helper"

RSpec.describe Condition do
  describe "knows attributes" do
      let(:condition) { Condition.create(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0) }
    it "returns condition date" do
      result = condition.date
      expect(result).to eq(Date.strptime("8/7/2015", '%d/%m/%Y'))
    end
    it "returns max temp" do
        result = condition.max_temp
        expect(result).to eq(88)
    end
    it "returns min temp" do
        result = condition.min_temp
        expect(result).to eq(55)
    end
    it "returns mean temp" do
        result = condition.mean_temp
        expect(result).to eq (70)
    end
    it "returns mean humidity" do
        result = condition.mean_humidity
        expect(result).to eq (3)
    end
    it "returns mean visibility" do
        result = condition.mean_visibility
        expect(result).to eq (4)
    end
    it "returns mean wind speed" do
        result = condition.mean_wind_speed
        expect(result).to eq (1)
    end
    it "returns precipitation" do
        result = condition.precipitation
        expect(result).to eq (0)
    end
  end

  describe "validations" do
    it "is invalid without a date" do
      condition = Condition.new(max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0)
      expect(condition).to_not be_valid
    end

    it "is invalid without a max temp" do
      condition = Condition.new(date: "8/7/2015", min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0)
      expect(condition).to_not be_valid
    end

    it "is invalid without a min temp" do
      condition = Condition.new(date: "8/7/2015", max_temp: 88,mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0)
      expect(condition).to_not be_valid
    end

    it "is invalid without a mean temp" do
      condition = Condition.new(date: "8/7/2015", max_temp: 88, min_temp: 55,mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0)
      expect(condition).to_not be_valid
    end

    it "is invalid without a mean humidity" do
      condition =  Condition.new(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_visibility: 4, mean_wind_speed: 1, precipitation:0)
      expect(condition).to_not be_valid
    end

    it "is invalid without a mean visibility" do
        condition =  Condition.new(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3,mean_wind_speed: 1, precipitation:0)
    end

    it "is invalid without a mean_wind_speed" do
      condition =  Condition.new(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, precipitation:0)
      expect(condition).to_not be_valid
    end

    it "is invalid without a precipiation" do
      condition =  Condition.new(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1)
      expect(condition).to_not be_valid
    end

    it "should be valid with all attributes" do
      condition =  Condition.new(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0)
      expect(condition).to be_valid
    end
  end
end
