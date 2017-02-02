require_relative '../../spec_helper'

RSpec.describe "When a user visits /trips/1" do
  it "can find detailed information about an specific trip" do
    Trip.create(duration: 420,
                    start_date: "02/01/2017",
                    end_date: "02/01/2017",
                    subscription: "Customer",
                    zipcode: "80602",
                    start_station_id: 44 ,
                    end_station_id: 55,
                    bike_id: 555
                    )
    visit '/trips/1'
    expect(page).to have_xpath("//input[@value='delete']")
  end


  it "gets presented with main header" do
    Trip.create(duration: 420,
                    start_date: "02/01/2017",
                    end_date: "02/01/2017",
                    subscription: "Customer",
                    zipcode: "80602",
                    start_station_id: 44 ,
                    end_station_id: 55,
                    bike_id: 555
                    )

    visit '/trips/1'
    expect(page).to have_text("Trip details")
  end
end
