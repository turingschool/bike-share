require './spec/spec_helper'


feature 'Single station page' do
  background do
    Station.create! id: 9876543210,
                    city: 'land of bikes',
                    name: 'pile of bikes',
                    dock_count: 999999,
                    lat: 888.888,
                    long: 777.777,
                    installation_date: Date.parse('22/1/3333')
    visit '/stations/9876543210'
  end

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'displays name' do
    expect(page).to have_content('pile of bikes')
  end

  it 'displays city' do
    expect(page).to have_content(/city/i)
    expect(page).to have_content('pile of bikes')
  end

  it 'displays dock count' do
    expect(page).to have_content(/dock count/i)
    expect(page).to have_content('999999')
  end

  it 'displays latitude' do
    expect(page).to have_content(/latitude/i)
    expect(page).to have_content('888.888')
  end

  it 'displays longetude' do
    expect(page).to have_content(/longetude/i)
    expect(page).to have_content('777.777')
  end

  it 'displays installation date' do
    expect(page).to have_content(/installation date/i)
    expect(page).to have_content('1')
    expect(page).to have_content('22')
    expect(page).to have_content('3333')
  end

end
