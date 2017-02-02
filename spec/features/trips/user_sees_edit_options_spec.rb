require_relative '../../spec_helper'

RSpec.describe "When a user visits /trips/1/edit" do
  it "they see a header indicating they are in a trip edit page" do
    trip = Trip.create(duration: 420,
                    start_date: "02/01/2017",
                    end_date: "02/01/2017",
                    subscription: "Customer",
                    zipcode: "80602",
                    start_station_id: 44 ,
                    end_station_id: 55,
                    bike_id: 555
                    )
    visit "/trips/#{ trip.id }/edit"

    expect(page).to have_content("Edit your trip")
  end

  it "they see form to submit any edits for trip" do
    trip = Trip.create(duration: 420,
                    start_date: "02/01/2017",
                    end_date: "02/01/2017",
                    subscription: "Customer",
                    zipcode: "80602",
                    start_station_id: 44 ,
                    end_station_id: 55,
                    bike_id: 555
                    )
    visit "/trips/#{ trip.id }/edit"

    expect(page).to have_xpath("//input[@value='Submit']")
  end

  it "they see form to submit any edits for trip" do
    trip = Trip.create(duration: 420,
                    start_date: "02/01/2017",
                    end_date: "02/01/2017",
                    subscription: "Customer",
                    zipcode: "80602",
                    start_station_id: 44 ,
                    end_station_id: 55,
                    bike_id: 555
                    )
    visit "/trips/#{ trip.id }/edit"
    expect(page).to have_content("Duration")
  end

end
