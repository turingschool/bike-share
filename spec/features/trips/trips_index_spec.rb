require './spec/spec_helper'

feature 'edit station page' do
  background do
    Trip.create!  duration: 10,
                  start_date: "01/01/2001",
                  start_station: "Station 01",
                  end_date:"02/01/2001",
                  end_station:"Station 02",
                  bike_id: 1001,
                  subscription_type: "Subscriber",
                  zip_code: 80303
    visit '/stations/9876543210/edit'
  end

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'displays duration' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_content("10")
  end

  it 'displays start date' do
    expect(page).to have_content(/start date/i)
    expect(page).to have_content("XXX")
  end

  it 'displays start station' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_content("10")
  end

  it 'displays end date' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_content("XXX")
  end

  it 'displays end station' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_content("10")
  end

  it 'displays bike id' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_content("10")
  end

  it 'displays subscription' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_content("10")
  end

  it 'displays zip code' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_content("10")
  end


  # it 'displays multiple items' do
  #   stations = all '#stations *'
  #   expect(Station.count).to eq 2
  # end

end
