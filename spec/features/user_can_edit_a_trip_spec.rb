describe "User visits '/trips/1/edit'" do
  it "and sees the header of Update Trip" do
  #fixture

  Trip.create(
  duration: 60,
  start_station: 54,
  end_station: 66,
  bike_id: 66,
  subscription_type:SubscriptionType.create(subscription_type: "Customer"),
  trip_date: Date.new,
  zip_code: ZipCode.create(zip_code: 83638)
)

    visit('/trips/1/edit')



    expect(page).to have_content("Update a trip")
    expect(page).to have_content("duration")
    expect(page).to have_content("date")
    expect(page).to have_content("start station")
    expect(page).to have_content("end station")
    expect(page).to have_content("bike id")
    expect(page).to have_content("subscription type")
    expect(page).to have_content("zip code")

    within ("form") do
      fill_in :duration, with: "66"
      click_on "thing"
    end

expect(page).to have_content("duration: 66 minutes")
expect(current_path).to eq('/trips/1')

  end
end
