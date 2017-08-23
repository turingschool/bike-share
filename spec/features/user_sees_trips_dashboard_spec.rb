RSpec.describe "User visits '/trips'" do

  before :each do
    start_date_1 = DateTime.new(2001,2,3,4,5)
    end_date_1 = DateTime.new(2001,3,3,4,5)
    start_date_2 = DateTime.new(2001,2,3,4,6)
    end_date_2 = DateTime.new(2001,3,3,4,6)

    Trip.create(duration: 400, start_date: start_date_1, start_station_id: 15, end_date: end_date_1, end_station_id: 20, bike_id: 420, subscription_type: "Subscriber")
    Trip.create(duration: 500, start_date: start_date_2, start_station_id: 20, end_date: end_date_2, end_station_id: 15, bike_id: 223, subscription_type: "Customer")
  end

  it 'and sees all trip durations' do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content('400')
    expect(page).to have_content('500')
  end

  it 'and sees the start dates' do
    visit('/trips')

    save_and_open_page

    expect(page).to have_content('2001-02-03')
    expect(page).to have_content('2001-02-03')
  end
end
