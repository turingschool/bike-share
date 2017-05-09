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
end
