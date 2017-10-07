require './spec/spec_helper'

feature 'edit station page' do
  background do
    Station.create! id: 9876543210,
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

end
