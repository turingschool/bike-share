describe "User can access edit trip page" do
  it "and view form to edit station" do

    trip_one = Trip.create(duration: 174,
                           start_date: "2013-08-29 09:08:00",
                           start_station_name: "2nd at South Park",
                           end_date: "2013-08-29 09:11:00",
                           end_station_name: "10th at South Park",
                           bike_id: 288,
                           subscription_type: "Subscriber",
                           zip_code: "94114")

    visit '/trips/1/edit'

    expect(page).to have_content("Edit Trip #{trip_one.id}")
  end
  it "and edit trip" do
    trip_one = Trip.create(duration: 174,
                           start_date: "2013-08-29 09:08:00",
                           start_station_name: "2nd at South Park",
                           end_date: "2013-08-29 09:11:00",
                           end_station_name: "10th at South Park",
                           bike_id: 288,
                           subscription_type: "Subscriber",
                           zip_code: "94114")
    visit "/trips/#{trip_one.id}/edit"

    fill_in("trip[duration]", with: 173)
    fill_in("trip[start_date]", with: "2014-08-21 09:08:00")
    fill_in("trip[start_station_name]", with: "Yoyo")
    fill_in("trip[end_date]", with: "2015-08-22 09:08:00")
    fill_in("trip[end_station_name]", with: "Memememe")
    fill_in("trip[bike_id]", with: 299)
    fill_in("trip[subscription_type]", with: "Subscriber")
    fill_in("trip[zip_code]", with: "90210")
    click_on("Update Trip")

    expect(page).to have_content("173")
    expect(page).to have_content("Yoyo")
    expect(page).to have_content("Memememe")
    expect(page).to have_content("Subscriber")
    expect(page).to have_content("90210")
    expect(current_path).to eq("/trips/#{Trip.last.id}")
  end
end
