describe "User visits '/trips/1'" do
  it "and sees the header of trip id" do
  #fixture
  trip = Trip.create(
    duration: 60,
    start_station: 54,
    end_station: 66,
    bike_id: 66,
    subscription_type:SubscriptionType.create(subscription_type: "Customer"),
    trip_date: Date.strptime("2/13/2013", "%m/%d/%Y"),
    zip_code: ZipCode.create(zip_code: 83638)
)
    visit('/trips/1')
    expect(page).to have_content("duration")
    expect(page).to have_content("date")
    expect(page).to have_content("start station")
    expect(page).to have_content("end station")
    expect(page).to have_content("bike number")
    expect(page).to have_content("subscription type")
    expect(page).to have_content("zip code")



  end
end
