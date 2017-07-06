RSpec.describe "user can see one condition" do
  it "has attributes and buttons" do
    date_str = DateTime.strptime('3/9/2013', '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    zip_code = ZipCode.find_or_initialize_by(zip_code: 32159)
    condition_1 = Weather.create!(bike_share_date: date, max_temperature_f: 74.0, zip_code: zip_code)

    visit '/conditions/1'
    save_and_open_page
    expect(page).to have_content("Conditions for 2013-03-09")
    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
  end
end
