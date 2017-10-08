require './spec/spec_helper'

feature 'edit station page' do
  context 'for a station that exists'
    background do
      Station.create! id: 3,
                      city: "San Jose",
                      name: "San Jose Civic Center",
                      dock_count: 15,
                      lat: 37.330698,
                      long: -121.888979,
                      installation_date: '8/5/2013'
      visit '/stations/3/edit'
    end

    it 'has status code 200' do
      expect(page.status_code).to eq(200)
    end

    it 'has a form' do
      expect(page).to have_css('form')
    end

    it 'has name field' do
      expect(page).to have_field('station[name]')
    end

    it 'has city field' do
      expect(page).to have_content(/city/i)
      expect(page).to have_field('station[city]')
    end

    it 'has dock count field' do
      expect(page).to have_content(/dock count/i)
      expect(page).to have_field('station[dock_count]')
    end

    it 'has latitude field' do
      expect(page).to have_content(/latitude/i)
      expect(page).to have_field('station[lat]')
    end

    it 'has longitude field' do
      expect(page).to have_content(/longitude/i)
      expect(page).to have_field('station[long]')
    end

    it 'has installation date field' do
      expect(page).to have_content(/installation date/i)
      expect(page).to have_field('station[installation_date]')
    end

    context 'when user inputs valid data' do
      background do
        fill_in "station[name]"               with: "San Jose Civic Center"
        fill_in "station[city]"               with: "San Jose"
        fill_in "station[dock_count]"         with: 15
        fill_in "station[lat]"                with: 37.330698
        fill_in "station[long]"               with: -121.888979
        fill_in "station[installation_date]"  with: "8/5/2013"
        click_button "submit"
      end

      it 'then the user is redirected to show page with success message'
        has_current_path?("/stations/#{station.id}", only_path: true)
        expect(page).to have_content(/saved/i)
      end
    end

    context 'when user inputs invalid data'
      background do
        fill_in "station[name]"               with: "San Jose Civic Center"
        fill_in "station[city]"               with: 42
        fill_in "station[dock_count]"         with: 15
        fill_in "station[lat]"                with: 37.330698
        fill_in "station[long]"               with: -121.888979
        fill_in "station[installation_date]"  with: "8/5/2013"
        click_button "submit"
      end

      it 'then user is redirected to eidt page with error flag on invalid data field'
        has_current_path?("stations/3/edit", only_path: true)
        expect(page).to have_content(/error/i)
      end
    end

  context 'for a station that does not exist'
    it 'then the user is redirected to 404 error message'
      visit 'stations/1/edit'
      expect(page).to have_content(/not found/i)
    end
  end

  context 'when user clicks on delete button'
    background do
      click_button 'delete'
    end

    it 'then user is redirected to index page'
      has_current_path?("/stations", only_path: true)
      expect(page).to have_content(/delete successful/i)
    end
  end
end
