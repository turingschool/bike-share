require './spec/spec_helper'

RSpec.describe "When a user views conditions dashboard" do
  before {
    city_1 = City.create(name: "squeevillia")
    station = Station.create!(
                  name: "something",
                  dock_count: 1,
                  city_id: city_1.id,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: -121.9,
                  latitude: 30.7
    )
    Trip.create(
                  duration: 60,
                  start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: station.id,
                  end_date: DateTime.strptime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: station.id,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    Trip.create(
                  duration: 60,
                  start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: station.id,
                  end_date: DateTime.strptime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: station.id,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    Trip.create(
                  duration: 60,
                  start_date: DateTime.strptime("08/29/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: station.id,
                  end_date: DateTime.strptime("08/29/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: station.id,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    Trip.create(
                  duration: 60,
                  start_date: DateTime.strptime("08/28/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: station.id,
                  end_date: DateTime.strptime("08/28/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: station.id,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    Trip.create(
                  duration: 60,
                  start_date: DateTime.strptime("08/28/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: station.id,
                  end_date: DateTime.strptime("08/28/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: station.id,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    Trip.create(
                  duration: 60,
                  start_date: DateTime.strptime("08/31/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: station.id,
                  end_date: DateTime.strptime("08/31/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: station.id,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    Trip.create(
                  duration: 60,
                  start_date: DateTime.strptime("08/28/2013 11:11", "%m/%d/%Y %H:%M"),
                  start_station_id: station.id,
                  end_date: DateTime.strptime("08/28/2013 11:12", "%m/%d/%Y %H:%M"),
                  end_station_id: station.id,
                  bike_id: 1,
                  subscription_type: "Subscriber"
    )
    zip = Zipcode.create(zipcode: "09000")
    condition = Condition.create(
                                date: Date.strptime("08/31/2013",'%m/%d/%Y'),
                                max_temp: 87.0,
                                mean_temp: 86.0,
                                min_temp: 54.0,
                                mean_humidity: 90.0,
                                mean_visibility: 10.0,
                                mean_wind_speed: 7.0,
                                precipitation: 0.7,
                                zipcode_id: zip.id
                                )
    condition_1 = Condition.create(
                                date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                max_temp: 87.0,
                                mean_temp: 76.0,
                                min_temp: 54.0,
                                mean_humidity: 90.0,
                                mean_visibility: 7.0,
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
                                mean_visibility: 8.0,
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
                                mean_visibility: 2.0,
                                mean_wind_speed: 2.0,
                                precipitation: 0.3,
                                zipcode_id: zip.id
                                )
  }
  it "loads the appropriate temperature ranges" do
    visit("/conditions-dashboard")

    expect(page).to_not have_css('table:nth-of-type(1) td:nth-child(1)', text: "90-99")

    within ('table:nth-of-type(1) tbody tr:first-child td:nth-child(1)') do
      have_content("80-89")
    end

    within ('table:nth-of-type(1) tbody tr:nth-child(2) td:nth-child(1)') do
      have_content("70-79")
    end

    within ('table:nth-of-type(1) tbody tr:nth-child(2) td:nth-child(1)') do
      have_content("60-69")
    end

    expect(page).to_not have_css('table:nth-of-type(1) tbody tr td', text: "50-59")

  end

  it "loads the appropriate average rides temp" do
    within ('table:nth-of-type(1) tbody tr:first-child td:nth-child(2)') do
      have_content("1.5")
    end

    within ('table:nth-of-type(1) tbody tr:nth-child(2) td:nth-child(2)') do
      have_content("0")
    end

    within ('table:nth-of-type(1) tbody tr:nth-child(2) td:nth-child(2)') do
      have_content("3")
    end
  end

  it "loads the appropriate most rides temp" do
    within ('table:nth-of-type(1) tbody tr:first-child td:nth-child(3)') do
      have_content("2")
    end

    within ('table:nth-of-type(1) tbody tr:nth-child(2) td:nth-child(3)') do
      have_content("0")
    end

    within ('table:nth-of-type(1) tbody tr:nth-child(2) td:nth-child(3)') do
      have_content("3")
    end
  end

  it "loads the appropriate least rides temp" do
    within ('table:nth-of-type(1) tbody tr:first-child td:nth-child(4)') do
      have_content("1")
    end

    within ('table:nth-of-type(1) tbody tr:nth-child(2) td:nth-child(4)') do
      have_content("0")
    end

    within ('table:nth-of-type(1) tbody tr:nth-child(2) td:nth-child(4)') do
      have_content("3")
    end
  end

  it "loads the appropriate precipitation ranges" do
    visit("/conditions-dashboard")

    expect(page).to_not have_css('table:nth-of-type(2) tbody tr td', text: "0.5-1.9")

    within ('table:nth-of-type(2) tbody tr:first-child td:nth-child(1)') do
      have_content("1.00-1.49")
    end

    within ('table:nth-of-type(2) tbody tr:nth-child(2) td:nth-child(1)') do
      have_content("0.50-0.99")
    end

    within ('table:nth-of-type(2) tbody tr:nth-child(2) td:nth-child(1)') do
      have_content("0.00-0.49")
    end
  end

  it "loads the appropriate average rides precipitation" do
    within ('table:nth-of-type(2) tbody tr:first-child td:nth-child(2)') do
      have_content("1.5")
    end

    within ('table:nth-of-type(2) tbody tr:nth-child(2) td:nth-child(2)') do
      have_content("0")
    end

    within ('table:nth-of-type(2) tbody tr:nth-child(2) td:nth-child(2)') do
      have_content("3")
    end
  end

  it "loads the appropriate most rides precipitation" do
    within ('table:nth-of-type(2) tbody tr:first-child td:nth-child(3)') do
      have_content("2")
    end

    within ('table:nth-of-type(2) tbody tr:nth-child(2) td:nth-child(3)') do
      have_content("0")
    end

    within ('table:nth-of-type(2) tbody tr:nth-child(2) td:nth-child(3)') do
      have_content("3")
    end
  end

  it "loads the appropriate least rides precipitation" do
    within ('table:nth-of-type(2) tbody tr:first-child td:nth-child(4)') do
      have_content("1")
    end

    within ('table:nth-of-type(2) tbody tr:nth-child(2) td:nth-child(4)') do
      have_content("0")
    end

    within ('table:nth-of-type(2) tbody tr:nth-child(2) td:nth-child(4)') do
      have_content("3")
    end
  end

  it "loads the appropriate wind speed ranges" do
    visit("/conditions-dashboard")

    expect(page).to_not have_css('table:nth-of-type(3) tbody tr td', text: "12-15")

    within ('table:nth-of-type(3) tbody tr:first-child td:nth-child(1)') do
      have_content("8-11")
    end

    within ('table:nth-of-type(3) tbody tr:nth-child(2) td:nth-child(1)') do
      have_content("4-7")
    end

    within ('table:nth-of-type(3) tbody tr:nth-child(2) td:nth-child(1)') do
      have_content("0-3")
    end
  end

  it "loads the appropriate average rides wind speed" do
    within ('table:nth-of-type(3) tbody tr:first-child td:nth-child(2)') do
      have_content("1.5")
    end

    within ('table:nth-of-type(3) tbody tr:nth-child(2) td:nth-child(2)') do
      have_content("0")
    end

    within ('table:nth-of-type(3) tbody tr:nth-child(2) td:nth-child(2)') do
      have_content("3")
    end
  end

  it "loads the appropriate most rides wind speed" do
    within ('table:nth-of-type(3) tbody tr:first-child td:nth-child(3)') do
      have_content("2")
    end

    within ('table:nth-of-type(3) tbody tr:nth-child(2) td:nth-child(3)') do
      have_content("0")
    end

    within ('table:nth-of-type(3) tbody tr:nth-child(2) td:nth-child(3)') do
      have_content("3")
    end
  end

  it "loads the appropriate least rides wind speed" do
    within ('table:nth-of-type(3) tbody tr:first-child td:nth-child(4)') do
      have_content("1")
    end

    within ('table:nth-of-type(3) tbody tr:nth-child(2) td:nth-child(4)') do
      have_content("0")
    end

    within ('table:nth-of-type(3) tbody tr:nth-child(2) td:nth-child(4)') do
      have_content("3")
    end
  end

  it "loads the appropriate visibility ranges" do
    visit("/conditions-dashboard")

    expect(page).to_not have_css('table:nth-of-type(4) tbody tr td', text: "12-15")

    within ('table:nth-of-type(4) tbody tr:first-child td:nth-child(1)') do
      have_content("8-11")
    end

    within ('table:nth-of-type(4) tbody tr:nth-child(2) td:nth-child(1)') do
      have_content("4-7")
    end

    within ('table:nth-of-type(4) tbody tr:nth-child(2) td:nth-child(1)') do
      have_content("0-3")
    end
  end

  it "loads the appropriate average rides visibility" do
    within ('table:nth-of-type(4) tbody tr:first-child td:nth-child(2)') do
      have_content("1.5")
    end

    within ('table:nth-of-type(4) tbody tr:nth-child(2) td:nth-child(2)') do
      have_content("0")
    end

    within ('table:nth-of-type(4) tbody tr:nth-child(2) td:nth-child(2)') do
      have_content("3")
    end
  end

  it "loads the appropriate most rides visibility" do
    within ('table:nth-of-type(4) tbody tr:first-child td:nth-child(3)') do
      have_content("2")
    end

    within ('table:nth-of-type(4) tbody tr:nth-child(2) td:nth-child(3)') do
      have_content("0")
    end

    within ('table:nth-of-type(4) tbody tr:nth-child(2) td:nth-child(3)') do
      have_content("3")
    end
  end

  it "loads the appropriate least rides visibility" do
    within ('table:nth-of-type(4) tbody tr:first-child td:nth-child(4)') do
      have_content("1")
    end

    within ('table:nth-of-type(4) tbody tr:nth-child(2) td:nth-child(4)') do
      have_content("0")
    end

    within ('table:nth-of-type(4) tbody tr:nth-child(2) td:nth-child(4)') do
      have_content("3")
    end
  end
end
