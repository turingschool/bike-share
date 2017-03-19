require_relative '../spec_helper'


RSpec.describe "When a user visits '/show'" do
  it 'they see a single station' do

    city = City.create(name: 'Denver')

    city.stations.create(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', dock_count: 12, installation_date: Date.parse("8/6/2013"))

    visit '/stations/1'

    within('h2.title') do
      expect(page).to have_content('Turing Station')
    end

    within('p.dock_count') do
      expect(page).to have_content(12)
    end

    within('p.city') do
      expect(page).to have_content('Denver')
    end

    within('p.installation_date') do
      expect(page).to have_content(Date.parse('8/6/2013'))
    end
  end
end
