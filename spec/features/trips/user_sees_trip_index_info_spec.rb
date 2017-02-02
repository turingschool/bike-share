require_relative '../../spec_helper'

RSpec.describe "When a user visits /trips" do
  it "they see a header indicating trips results" do
      visit '/trips'

      expect(page).to have_content("First 30 Trips")
  end

  it "they see link to next results" do
    x = 1
      35.times do
       Trip.create(duration: 420,
                start_date: "02/01/2017",
                end_date: "02/01/2017",
                subscription: "Customer",
                zipcode: "80602",
                start_station_id: 44 ,
                end_station_id: 55,
                bike_id: 555
                )
      x += 1
    end
    visit '/trips'

    expect(page).to have_content("Next")
  end


  it "they see edit button" do
       Trip.create(duration: 420,
                start_date: "02/01/2017",
                end_date: "02/01/2017",
                subscription: "Customer",
                zipcode: "80602",
                start_station_id: 44 ,
                end_station_id: 55,
                bike_id: 555
                )

    visit '/trips'

    expect(page).to have_xpath("//input[@value='Edit']")
  end

  it "they see delete button visible" do
       Trip.create(duration: 420,
                start_date: "02/01/2017",
                end_date: "02/01/2017",
                subscription: "Customer",
                zipcode: "80602",
                start_station_id: 44 ,
                end_station_id: 55,
                bike_id: 555
                )

    visit '/trips'
    expect(page).to have_xpath("//input[@value='Delete Trip']")
  end

end
