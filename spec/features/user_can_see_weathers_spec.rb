
RSpec.describe "user can see weathers" do
  it "shows all weathers with buttons" do
    date_str = DateTime.strptime('8/29/2013', '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    zip_code = ZipCode.find_or_initialize_by(zip_code: 98059)
    Weather.create!(bike_share_date: date, max_temperature_f: 74.0, zip_code: zip_code)

    visit '/weather'
    save_and_open_page
    expect(page).to have_content('Weather')
    expect(page).to have_content('98059')
    expect(page).to find_button('edit')
    expect(page).to find_button('delete')
  end
end
