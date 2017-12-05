require 'spec_helper'


describe 'As a visitor' do
  describe 'when I go to "/stations/:id/edit" ' do
    before :each do
      @station_1 = Station.create(name: "SF", dock_count: 5,
      city: "San Francisco", installation_date: "2013-08-23")

      visit "/stations/#{@station_1.id}/edit"
    end

    it "should give me a form with several form fields to edit with the option to submit which will redirect me to stations index" do
      fill_in "station[name]", with: "Embarcadero"
      fill_in "station[dock_count]", with: 24
      fill_in "station[city]", with: "Man Francisco"
      fill_in "station[installation_date]", with: "2013-08-01"

      click_button("Submit")

      expect(current_path).to eq("/stations/#{@station_1.id}")
    end
  end
end
