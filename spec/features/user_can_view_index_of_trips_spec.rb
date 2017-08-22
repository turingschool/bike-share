describe "User visits '/trips'" do
  it "sees a bunch of trips" do

    60.times do
      trip = Trip.create(
      duration: 60,
      start_station: 54,
      end_station: 66,
      bike_id: 66,
      subscription_type:SubscriptionType.create(subscription_type: "Customer"),
      start_date: StartDate.create(date: Date.strptime("02/13/2013", "%m/%d/%Y")),
      end_date: EndDate.create(date: Date.strptime("02/13/2013", "%m/%d/%Y")),
      zip_code: ZipCode.create(zip_code: 83638)
    )
  end
    visit('/trips')

    expect(page).to have_content("All Trips")
    expect(page.all("h3").count).to eq(30)

  end
  it "and can delete a record and still show thirty" do


        60.times do
          trip = Trip.create(
          duration: 60,
          start_station: 54,
          end_station: 66,
          bike_id: 66,
          subscription_type:SubscriptionType.create(subscription_type: "Customer"),
          start_date: StartDate.create(date: Date.strptime("02/13/2013", "%m/%d/%Y")),
          end_date: EndDate.create(date: Date.strptime("02/13/2013", "%m/%d/%Y")),
          zip_code: ZipCode.create(zip_code: 83638)
        )
      end
        visit('/trips')

    click_button('Delete', match: :first) 
    expect(page).to have_content("All Trips")
    expect(page.all("h3").count).to eq(30)
    end
end
