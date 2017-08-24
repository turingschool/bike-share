describe "User can access new station page" do
  it "and view form to create new station" do

    visit '/stations/new'

    page.has_content?('Name')
    page.has_content?('Dock Count')
    page.has_content?('City')
    page.has_content?('Installation Date')
  end
  it "and create a new station" do
    Station.create(name: "Panera", dock_count: 15, city: "Denver", installation_date: "2014-04-09")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "Panera",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 1,
                end_station_id: 2,
                subscription_type: "Subscriber",
                zip_code: "94114")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "Panera",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 2,
                end_station_id: 2,
                subscription_type: "Subscriber",
                zip_code: "94114")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "Panera",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 2,
                end_station_id: 1,
                subscription_type: "Subscriber",
                zip_code: "94114")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "Panera",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 1,
                end_station_id: 1,
                subscription_type: "Subscriber",
                zip_code: "94114")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "Panera",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 2,
                end_station_id: 2,
                subscription_type: "Subscriber",
                zip_code: "94114")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "Panera",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 1,
                end_station_id: 1,
                subscription_type: "Subscriber",
                zip_code: "94114")

    visit '/stations/new'

    fill_in("station[name]", with: "Turing")
    fill_in("station[dock_count]", with: 10)
    fill_in("station[city]", with: "Denver")
    fill_in("station[installation_date]", with: "2014-04-09")

    click_on("Create New Station")
    expect(page).to have_content("Turing")
    expect(page).to have_content("10")
    expect(page).to have_content("Denver")
    expect(page).to have_content("2014-04-09")
  end
end
