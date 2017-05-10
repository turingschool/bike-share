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

  describe ".get_mean_temp_intervals" do
    it "returns an array" do
      expect(described_class.get_mean_temp_intervals.class).to be Array
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
      expect(described_class.get_mean_temp_intervals).to match ["70-79", "60-69", "50-59"]
    end
  end
end
