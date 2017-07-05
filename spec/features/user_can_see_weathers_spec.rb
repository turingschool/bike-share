RSpec.describe "user can see conditions" do
  it "shows all conditions with buttons" do
    date_str = DateTime.strptime('8/29/2013', '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    zip_code = ZipCode.find_or_initialize_by(zip_code: 98059)
    Weather.create!(bike_share_date: date, max_temperature_f: 74.0, zip_code: zip_code)

    visit '/conditions'

    expect(page).to have_content('Weather')
    expect(page).to have_content('98059')
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
  end

  it "only shows 31 records, with headers" do
    31.times do
      date_str = DateTime.strptime('8/29/2013', '%m/%d/%Y')
      date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
      zip_code = ZipCode.find_or_initialize_by(zip_code: 98059)
      Weather.create!(bike_share_date: date, max_temperature_f: 74.0, zip_code: zip_code)
    end

    visit '/conditions'

    expect(page).to have_selector('tr', count: 31)
  end
end
