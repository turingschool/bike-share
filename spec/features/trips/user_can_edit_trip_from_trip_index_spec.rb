require_relative '../../spec_helper'
RSpec.describe "User pushes button to edit trip on trip index" do
  it "updates the selected trip with user input" do
    Trip.create(
                duration: 999,
                start_date: "02/01/2017",
                end_date: "02/01/2017",
                subscription: "Customer",
                zipcode: "80602",
                start_station_id: 44 ,
                end_station_id: 55,
                bike_id: 555
                )
    visit "/trips"
    click_button('Edit')
    fill_in 'trip[duration]', with: 333
    click_button('Update Trip')
    #save_and_open_page
    expect(page).not_to have_content(999)
    expect(page).to have_content(333)
  end
end