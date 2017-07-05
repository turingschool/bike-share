RSpec.describe "User visits weather index page and" do

  before :each do
    @weather_date = BikeDate.create(date: "2017-04-19 14:14")
    @weather_day = Weather.create(date: @weather_date.id, max_temp: 85.0, mean_temp: 83.0, min_temp: 81.0, mean_humidity: 77.0, mean_visibility: 7.0, mean_wind: 12.0, precipitation: 1.0)
  end

  it "sees weather index, link to station index, link to trip index, link to create new weather day, link to home"
    visit '/weather'

    expect(page).to have_content "Weather Index"
    page.should have_selector(:link_or_button, 'All Stations')
    page.should have_selector(:link_or_button, 'All Trips'
    page.should have_selector(:link_or_button, 'Create New Weather Day')
    page.should have_selector(:link_or_button, 'Home')
  end

  it "sees the weather days in the database"
    visit '/weather'

    expect(page).to have_content "April 19, 2017"
  end

  it "takes you to the individual weather day view when you click edit"
    visit '/weather'

    click_link("Edit")

    expect(current_path). to eq ("/weather/#{@weather.id}/edit")
    expect(page).to have_content("Edit Weather")
  end

  it "sees a delete button for each weather day" do
    visit '/weather'

    expect(page).to have_button("Delete")
  end

  it "takes you back to the weather index page when you click delete" do
    visit '/weather'

    click_button('Delete')

    expect(current_path).to eq "/stations"
    expect(page).to_not have_content("April 29, 2017")
  end

end
