require './spec/spec_helper'

RSpec.describe "user wants to add station" do

  it "adds a station" do
    visit('/stations/new')

      fill_in "station[name]", with: 'Fluppydo'
      fill_in "station[dock_count]", with: 1981
      fill_in "city", with: 'Denver'
      fill_in "station[install_date]", with: '2008/10/21'

      click_button "Add Station"
      station = Station.last

      expect(current_path).to eq("/stations/#{station.id}")

      expect(page).to have_content("Fluppydo")
      expect(page).to have_content("Denver")
      expect(page).to have_content(1981)
      expect(page).to have_content('2008-10-21')
  end

  it "adds a station without a name" do
    visit('/stations/new')

      fill_in "station[dock_count]", with: 1981
      fill_in "city", with: 'Denver'
      fill_in "station[install_date]", with: '2008/10/21'

      click_button "Add Station"
      station = Station.last

      expect(current_path).to eq("/stations/new")

      expect(page).to have_content('ENTER VALUE HERE!!!')
      expect(page).to have_content('Denver')
      expect(page).to have_content(1981)
      expect(page).to have_content('2008-10-21') 
  end

end