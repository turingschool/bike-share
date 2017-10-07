require './spec/spec_helper'

feature 'When a user visits trip edit page' do
  background do
    Trip.create!  id: 1,
                  duration: 10,
                  start_date: "01/01/2001",
                  start_station_id: "42",
                  end_date:"02/01/2001",
                  end_station_id: "43",
                  bike_id: 1001,
                  subscription_type: "Subscriber",
                  zip_code: 80303
    visit '/trips/1/edit'
  end

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'has a form' do
    expect(page).to have_css('form')
  end

  it 'they see a duration field' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_field('trip[duration]')
  end

  it 'they see a start date field' do
    expect(page).to have_content(/start date/i)
    expect(page).to have_field('trip[start_date]')
  end

  it 'they see a start station field' do
    expect(page).to have_content(/start station/i)
    expect(page).to have_field('trip[start_station]')
  end

  it 'they see an end date field' do
    expect(page).to have_content(/end date/i)
    expect(page).to have_field('trip[end_date]')
  end

  it 'they see an end station field' do
    expect(page).to have_content(/end station/i)
    expect(page).to have_field('trip[end_station]')
  end

  it 'they see a bike station field' do
    expect(page).to have_content(/bike id/i)
    expect(page).to have_field('trip[bike_id]')
  end

  it 'they see a subscription type field' do
    expect(page).to have_content(/subscription type/i)
    expect(page).to have_field('trip[subscription_type]')
  end

  it 'they see a zip code field' do
    expect(page).to have_content(/zip code/i)
    expect(page).to have_field('trip[zip_code]')
  end
end
