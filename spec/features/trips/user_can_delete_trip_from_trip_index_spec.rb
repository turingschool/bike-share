require_relative '../../spec_helper'
RSpec.describe "User deletes a trip" do
  it "deletes the selected trip from trips index" do
    Trip.create(
                duration: 420,
                start_date: "02/01/2017",
                end_date: "02/01/2017",
                subscription: "Customer",
                zipcode: "80602",
                start_station_id: 44 ,
                end_station_id: 55,
                bike_id: 555
                )
    visit "/trips"
    click_button('Delete Trip')
    #save_and_open_page
    expect(page).not_to have_content("02/01/2017")
  end
end