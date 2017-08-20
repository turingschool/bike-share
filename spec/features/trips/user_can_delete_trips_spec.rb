describe "User can delete trip" do
  it "and click on button" do

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "2nd at South Park",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "10th at South Park",
                bike_id: 288,
                subscription_type: "Subscriber",
                zip_code: "94114")

    Trip.create(duration: 174,
                start_date: "2013-08-29 09:08:00",
                start_station_name: "2nd at South Park",
                end_date: "2013-08-29 09:11:00",
                end_station_name: "Hello Kitty",
                bike_id: 288,
                subscription_type: "Subscriber",
                zip_code: "94114")

    visit '/trips/1'
    click_on("delete")

    expect(current_path).to eq('/trips')
    expect(page).to_not have_content('10th at South Park')
    expect(page).to have_content('Hello Kitty')
  end
end
