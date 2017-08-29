describe "Weather Dashboard" do
  it "can be accessed" do
    visit ("/weather_dashboard")

    expect(page).to respond_with(200)
    expect(page).to have_content("Weather Dashboard")
    expect(page).to have_content("By Max Temperature")
    expect(page).to have_content("By Precipitation")
    expect(page).to have_content("By Wind Speed")
    expect(page).to have_content("By Visibility")
    expect(page).to have_css("table", count => 4)
    expect(page).to have_css("th", count => 24)
  end
end
