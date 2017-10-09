require './spec/spec_helper'

feature 'when user visits trip show page' do
    background do
      Trip.create!    id: 1,
                      duration: 10,
                      start_date: "2001-01-01",
                      start_station_id: 8,
                      end_date: "2001-02-01",
                      end_station_id: 7,
                      bike_id: 404,
                      subscription_type: "Monthly",
                      zip_code: 32210

      Station.create! id: 8,
                      city: 'land of bikes',
                      name: 'pile of bikes',
                      dock_count: 999999,
                      lat: 888.888,
                      long: 777.777,
                      installation_date: Date.parse('22/1/3333')

      visit '/trips/1'
    end

    it 'has status code 200' do
        expect(page.status_code).to eq(200)
    end

    it 'they see the duration' do
        expect(page).to have_content(/duration/i)
        expect(page).to have_content("10")
    end

    it 'they see the start date' do
        skip
        expect(page).to have_content(/start date/i)
        expect(page).to have_content("2001-01-01")
    end

    it 'they see the start station' do #has this been updated in the page so that the station name from the Station table is returned instead of the station number from the trip table?
        expect(page).to have_content(/start station/i)
        expect(page).to have_content("pile of bikes")
    end

    it 'they see the end date' do
        skip
        expect(page).to have_content(/end date/i)
        expect(page).to have_content("2001-02-01")
    end

    it 'they see the end station' do
        expect(page).to have_content(/end station/i)
        expect(page).to have_content("7")
    end

    it 'they see the bike id' do
        expect(page).to have_content(/bike id/i)
        expect(page).to have_content("404")
    end

    it 'they see the subscription type' do
        expect(page).to have_content(/subscription/i)
        expect(page).to have_content("Monthly")
    end

    it 'they see the zipcode' do
        expect(page).to have_content(/zip code/i)
        expect(page).to have_content("32210")
    end

end
