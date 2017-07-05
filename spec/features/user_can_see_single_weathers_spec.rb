RSpec.describe "user can see one condition" do
  it "has attributes and delete button" do
    date_str = DateTime.strptime('3/9/2013', '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    zip_code = ZipCode.find_or_initialize_by(zip_code: 32159)
    condition_1 = Weather.create!(bike_share_date: date, max_temperature_f: 74.0, zip_code: zip_code)

    # date_str = DateTime.strptime('8/29/2013', '%m/%d/%Y')
    # date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    # zip_code = ZipCode.find_or_initialize_by(zip_code: 98059)
    # condition_2 = Weather.create!(bike_share_date: date, max_temperature_f: 80.0, zip_code: zip_code)
    #
    # date_str = DateTime.strptime('7/2/2013', '%m/%d/%Y')
    # date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    # zip_code = ZipCode.find_or_initialize_by(zip_code: 65438)
    # condition_3 = Weather.create!(bike_share_date: date, max_temperature_f: 95.0, zip_code: zip_code)
    id = condition_1.id
    visit '/conditions/id'

    expect(page).to have_content("Conditions on <%= condition_1.date %>")
  end
end
