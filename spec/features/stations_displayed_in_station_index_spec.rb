RSpec.describe "User sees all stations" do
  it "when visiting '/stations'" do
    #set up necessary data
    names = ["sam", "bret", "marc", "matt"]
    names.each do |name|
      Station.create(station_name: name, dock_count: 5, city_id: 1, installation_date_id: 1)
    end
    visit '/stations'

    names.each do |name|
    expect(page).to have_content(name)
    end
  end
end
