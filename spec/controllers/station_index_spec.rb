require './spec/spec_helper'


feature 'Station index page' do
  background do
    Station.create! id: 9876543210,
                    city: 'land of bikes',
                    name: 'pile of bikes',
                    dock_count: 999999,
                    lat: 888.888,
                    long: 777.777,
                    installation_date: Date.parse('22/1/3333')
    Station.create! id: 9876543211,
                    city: 'land of bikes',
                    name: 'pile of bikes',
                    dock_count: 999999,
                    lat: 888.888,
                    long: 777.777,
                    installation_date: Date.parse('22/1/3333')
    visit '/stations/9876543210/edit'
  end

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'displays city' do
    expect(page).to have_content(/city/i)
    expect(page).to have_content('pile of bikes')
  end

  it 'displays name' do
    expect(page).to have_content(/name/i)
    expect(page).to have_content('pile of bikes')
  end

  it 'displays dock count' do
    expect(page).to have_content(/dock count/i)
    expect(page).to have_content('999999')
  end

  it 'displays multiple items' do
    stations = all '#stations *'
    expect(stations.count).to eq 2
  end


end
