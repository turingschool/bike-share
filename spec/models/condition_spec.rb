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

  describe ".get_intervals_10" do
    it "returns an array" do
      expect(described_class.get_intervals_10('mean_temp').class).to be Array
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
    
  end
end
