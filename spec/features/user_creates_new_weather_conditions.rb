RSpec.describe "User creates a weather condition" do
  it "with valid attributes" do
    visit('/conditions/new')
    fill_in("weather[date]", with:"12/03/1991")
    fill_in("weather[max_temperature]", with:75)
    fill_in("weather[min_temperature]", with:55)
    fill_in("weather[mean_temperature]", with:60)
    fill_in("weather[mean_humidity]", with:60)
    fill_in("weather[mean_visibility]", with:5)
    fill_in("weather[mean_wind_speed]", with:10.0)
    fill_in("weather[precipitation]", with:2.0)

    click_link_or_button("submit")

    expect(current_path).to eq("/conditions")
    expect(page).to have_content("1991/12/03")
