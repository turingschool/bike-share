describe "/stations/show" do
  before :each do
    Station.create!(id: 1, name: "San Jose Diridon Caltrain Station", dock_count: 27, city: City.create(id:1, name: "San Jose"), installation_date: "2013-08-06", lat:0, lng:0)

    visit '/stations/1'
  end

  it "has status code 200" do
    expect(page.status_code).to eq(200)
  end

  it "user sees name of station" do
    expect(page).to have_content("San Jose Diridon Caltrain Station")
  end

  it "user sees dockcount" do
    expect(page).to have_content(27)
  end

  it "user sees city" do
    # require 'pry'/ binding.pry
    expect(page).to have_content("San Jose")
  end

  it "user sees installation date" do
    expect(page).to have_content("2013-08-06")
  end
end
