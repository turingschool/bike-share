describe "User can access edit station page" do
  it "and view form to edit station" do

    station_1 = Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "2014-04-09")

    visit '/stations/1/edit'

    expect(page).to have_content("Edit #{station_1.name} Station:")
  end
  it "and edit station" do

    Station.create(name: "King Sooper", dock_count: 15, city: "Denver", installation_date: "2014-04-09")
    Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "2014-04-09")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "King Sooper",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 1,
                end_station_id: 2,
                subscription_type: "Subscriber",
                zip_code: "94114")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "King Sooper",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Turing",
                bike_id: 288,
                start_station_id: 1,
                end_station_id: 2,
                subscription_type: "Subscriber",
                zip_code: "94114")
                require 'pry';binding.pry

    visit '/stations/1/edit'

    fill_in("station[name]", with: "Galvanize")
    fill_in("station[dock_count]", with: 10)
    fill_in("station[city]", with: "Denver")
    fill_in("station[installation_date]", with: "2014-04-09")
    click_on("Update Station")
    expect(page).to have_content("Galvanize")
    expect(page).to have_content("10")
    expect(page).to have_content("Denver")
    expect(page).to have_content("2014-04-09")

    expect(current_path).to eq("/stations/#{Station.last.id}")
  end
end
