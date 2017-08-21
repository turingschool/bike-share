describe "User can create a new trip" do
  it "when visiting 'trips/new'" do

    visit 'trips/new'

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
