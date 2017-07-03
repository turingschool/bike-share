RSpec.describe "user deletes station" do
  it "reroutes to station with deleted station not present" do

  date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
  date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))

  station_a = Station.create(name: "A", dock_count: 1, installation_date_id: 1, city: "Chicago")
  station_b = Station.create(name: "B", dock_count: 2, installation_date_id: 2, city: "Denver")

  visit("/stations")
  expect(page).to have_content("Chicago")
  click_button("delete", :match=> :first)
  # save_and_open_page

  expect(page).to_not have_content("Chicago")
  end
end
