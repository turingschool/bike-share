require_relative '../spec_helper'

# As a user when i visit the stations index page
# and i click on the view all stations link
# i should be redirected to the view all stations page
# and see stations listed

RSpec.describe 'when a user visits the all stations page' do
  it 'they can see stations' do
    city = City.create(name: "San Jose")
    city.stations.create!(name: "MLK", dock_count: 22, installation_date: "1999-9-11")

    visit('/stations')
    click_on "View Stations"

    expect(page).to have_content("MLK")
    expect(current_path).to eq('/stations/view_all')
  end
end
