describe "User can delete station" do
  it "and click on button" do
    Station.create(name: "Panera", dock_count: 15, city: "Denver", installation_date: "2014-04-09")
    Station.create(name: "Galvanize", dock_count: 10, city: "Denver", installation_date: "2014-04-09")
    Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "2014-04-09")
    Station.create(name: "Trader Joes", dock_count: 10, city: "Denver", installation_date: "2014-04-09")

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
                end_station_id: 3,
                subscription_type: "Subscriber",
                zip_code: "94114")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "Panera",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 4,
                end_station_id: 4,
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

    visit '/stations/2'
    click_on("delete")

    expect(current_path).to eq('/stations')
    expect(page).to_not have_content("Galvanize")
    expect(page).to have_content("Turing")
  end
end
