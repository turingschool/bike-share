RSpec.describe "user creates station" do
  it "with valid attributes" do
    date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
    date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
    date_3 = BikeShareDate.create(date: Date.strptime('4/12/2014', '%m/%d/%Y'))
    date_4 = BikeShareDate.create(date: Date.strptime('6/25/2017', '%m/%d/%Y'))
    date_5 = BikeShareDate.create(date: Date.strptime('2/1/2012', '%m/%d/%Y'))

    visit("/stations/new")
    fill_in("station[name]", with: "fifth")
    fill_in("station[dock_count]", with: 5)
    fill_in("station[installation_date_id]", with: "1990-04-16")
    fill_in("station[city]", with: "city")
    click_button("Create Station")
    #save_and_open_page
    station = Station.last
    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("fifth")
  end
end
