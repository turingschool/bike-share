require 'spec_helper'

describe 'As a visitor' do
  describe 'when I visit the "/trips/:id/edit" page' do

    before :each do
      @trip = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4, start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5, end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber", zip_code: 95355)

      visit "/trips/#{@trip.id}/edit"
    end

    it 'shows a form with form fields and has an option to submit changes' do
      fill_in 'trip[duration]', :with => 490
      fill_in 'trip[start_date]', :with => "2013-08-14"

      fill_in 'trip[end_date]', :with => "2013-08-14"

      fill_in 'trip[bike_id]', :with => 354
      fill_in 'trip[subscription_type]', :with => "Subscriber"
      fill_in 'trip[zip_code]', :with => 34387

      click_on("Submit")

      expect(current_path).to eq("/trips/#{@trip.id}")

      expect(page).to have_content(490)
    end

  end
end
