require './spec/spec_helper'

RSpec.describe Condition do
  it "has all the attributes it needs" do
    condition = Condition.create(
                                date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                max_temp: 87.0,
                                mean_temp: 76.0,
                                min_temp: 54.0,
                                mean_humidity: 90.0,
                                mean_visibility: 10.0,
                                mean_wind_speed: 11.0,
                                precipitation: 0,
                                )

    expect(condition).to be_valid
  end

  it "doesn't work without a date" do
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

  it "doesn't work without a max_temp" do
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

  it "doesn't work without a mean_temp" do
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

  it "doesn't work without a min_temp" do
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

  it "doesn't work without a mean_humidity" do
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

  it "doesn't work without a humidity" do
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

  it "doesn't work without a mean_wind_speed" do
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

  it "doesn't work without a precipitation" do
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

  it "returns 'selected' when passed its zipcode id" do
    condition = Condition.create(
                                date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                max_temp: 87.0,
                                mean_temp: 76.0,
                                min_temp: 54.0,
                                mean_humidity: 90.0,
                                mean_visibility: 10.0,
                                mean_wind_speed: 11.0,
                                zipcode_id: 1
                                )
      expect(condition.zipcode_selected?(1)).to eq "selected"
  end

  it "returns '' when passed a different zipcode id" do
    condition = Condition.create(
                                date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                max_temp: 87.0,
                                mean_temp: 76.0,
                                min_temp: 54.0,
                                mean_humidity: 90.0,
                                mean_visibility: 10.0,
                                mean_wind_speed: 11.0,
                                zipcode_id: 1
                                )
      expect(condition.zipcode_selected?(2)).to eq ""
  end

  describe ".get_intervals" do
    it "returns an array" do
      expect(described_class.get_intervals('mean_temp').class).to be Array
    end
    before {
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 76.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0,
                                  precipitation: 0,
                                  )
      condition = Condition.create(
                                  date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                  max_temp: 87.0,
                                  mean_temp: 66.0,
                                  min_temp: 54.0,
                                  mean_humidity: 90.0,
                                  mean_visibility: 10.0,
                                  mean_wind_speed: 11.0,
                                  precipitation: 0,
                                  )
      condition = Condition.create(
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
      expect(described_class.get_intervals('mean_temp')).to match [["70","79"], ["60","69"], ["50","59"]]
    end
  end

  describe "getting trip stats" do
    before {
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
      expect(Condition.ave_rides_per_condition(:mean_temp, 50, 59)).to eq(1)
      expect(Condition.ave_rides_per_condition(:mean_temp, 60, 69)).to eq(0.5)
    end

    it "can determine a date range for precipitation" do
      expect(Condition.determine_date_range(:precipitation, 0.0, 0.5).count).to eq(2)
      expect(Condition.determine_date_range(:precipitation, 1.0, 1.5).count).to eq(1)
    end

    it "can determine a date range for wind speed" do
      expect(Condition.determine_date_range(:mean_wind_speed, 0, 4).count).to eq(1)
      expect(Condition.determine_date_range(:mean_wind_speed, 5, 8).count).to eq(1)
      expect(Condition.determine_date_range(:mean_wind_speed, 9, 12).count).to eq(1)
    end

    it "can determine a date range for visibility" do
      expect(Condition.determine_date_range(:mean_visibility, 0, 4).count).to eq(3)
    end

  end
end
