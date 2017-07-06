RSpec.describe "User visits station index page and" do

  before :each do
    @city = City.create(city: "San Jose")
    @station = Station.create(name: "San Jose Civic Center", dock_count: 11, city_id: @city.id,
                              installation_date: "2017-08-30")
  end

  it "sees link to homepage and edit button" do

    visit '/stations'

    page.should have_selector(:link_or_button, 'Home')
    page.should have_selector(:link_or_button, 'Edit')
  end

  it "sees a the name of a station" do

    visit '/stations'

    expect(page).to have_content("San Jose Civic Center")
  end

  it "takes you to the individual station view when you click edit" do

    visit '/stations'

    click_link("Edit")

    expect(current_path).to eq("/stations/#{@station.id}/edit")
    expect(page).to have_content("Edit Station")
  end

  it "sees a delete button for each station" do

    visit '/stations'

    expect(page).to have_button('Delete')
  end

  it "takes you back to the station index page when you click delete" do

    visit '/stations'

    click_button('Delete')

    expect(current_path).to eq "/stations"
    expect(page).to_not have_content("San Jose Civic Center")
  end
end
