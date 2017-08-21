describe "User can edit a trip" do
  it "when visiting 'trips/edit/:id'" do
    Trip.create(id: 3, duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

    visit 'trips/3/edit'

    fill_in("trip[duration]", with: 45)
    fill_in("trip[start_date]", with: "2017-08-20 19:20:22")
    fill_in("trip[start_station_name]", with: "Over There")
    fill_in("trip[start_station_id]", with: 9099)
    fill_in("trip[end_date]", with: "2017-08-20 19:20:22")
    fill_in("trip[end_station_name]", with: "Over Here")
    fill_in("trip[end_station_id]", with: 7566)
    fill_in("trip[bike_id]", with: 547835)
    select("Customer", from: "trip[subscription_type]")
    fill_in("trip[zip_code]", with: 90210)
    click_on("Submit")

    expect(page).to have_content("The trip lasted 45 minutes")
    expect(page).to have_content("The trip started at Over There, and ended at Over Here")
    expect(page).to have_content("The trip was on bike# 547835")
    expect(page).to have_content("The trip zip code was 90210")
  end
end
