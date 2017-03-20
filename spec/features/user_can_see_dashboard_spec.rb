require_relative '../spec_helper'

RSpec.describe 'When a user visits /station-dashboard' do

  before do
    city = City.create(name: 'Denver')

    city.stations.create!(lat: 37.329732, long: -121.90178200000001, name: 'Beth\'s Station', dock_count: 12, installation_date: Date.parse('8/8/2017'))
    city.stations.create!(lat: 2, long: 1, name: 'Sam\'s Station', dock_count: 2, installation_date: Date.parse('12/10/1986'))
    city.stations.create!(lat: 2, long: 1, name: 'Chris\' Station', dock_count: 12, installation_date: Date.parse('8/8/2016'))
    city.stations.create!(lat: 2, long: 1, name: 'Mark\'s Station', dock_count: 2, installation_date: Date.parse('8/8/2016'))
  end

  it 'should display the total number of stations' do
    visit '/station-dashboard'

    expect(page).to have_content('Total station: 4')
  end
end
