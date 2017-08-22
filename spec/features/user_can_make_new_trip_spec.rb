describe "User visits '/trips/trip_new'" do
  it "and sees a form to make a new trip" do

  visit('/trips/new')

  within ("form") do
    fill_in :duration, with: "66"
    fill_in :start_date, with: "02/13/2013"
    fill_in :end_date, with: "02/13/2013"
    fill_in :start_station, with: "1"
    fill_in :end_station, with: "2"
    fill_in :bike_id, with: "3"
    fill_in :subscription_type, with: "Customer"
    fill_in :zip_code, with: "83638"
    click_on "thing"
  end

  expect(current_path).to eq('/trips/1')
  expect(page).to have_content("duration: 66 minutes")
end
end
