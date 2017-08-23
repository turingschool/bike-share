describe "Weather CRUD" do
  it "has main page" do
    visit('/conditions')

    is_expected.to respond_with 200
    is_expected.to have_content "Conditions By Day:"
  end

  it "can show new page" do
    visit('/conditions')
    click_button('NEW')

    is_expected.to respond_with 200
    is expected.to have_content "New Weather Condition"
    is_expected.to have_content weather.date.to_s
    is_expected.to have_content weather.max_temperature.to_s
    is_expected.to have_content weather.mean_temperature.to_s
    is_expected.to have_content weather.min_temperature.to_s
    is_expected.to have_content weather.mean_humidity.to_s
    is_expected.to have_content weather.mean_visibility.to_s
    is_expected.to have_content weather.mean_wind_speed.to_s
    is_expected.to have_content weather.precipitation.to_s
    is_expected.to have_content weather.zip_code.to_s
  end

  it "can show single weather" do
    visit('/conditions')
    click_button(...)

    expected(current_path).to_eq('/conditions/1')
    is_expected.to respond_with 200
    is_expectec.to have_content "Edit Weather"
    is_expected.to have_content weather.date.to_s
    is_expected.to have_content weather.max_temperature.to_s
    is_expected.to have_content weather.mean_temperature.to_s
    is_expected.to have_content weather.min_temperature.to_s
    is_expected.to have_content weather.mean_humidity.to_s
    is_expected.to have_content weather.mean_visibility.to_s
    is_expected.to have_content weather.mean_wind_speed.to_s
    is_expected.to have_content weather.precipitation.to_s
    is_expected.to have_content weather.zip_code.to_s
  end

  it "can show edit page" do
    visit('/conditions')
    click_button('EDIT' match: :fourth)
    weather = Weather.find(4)

    expected(current_path).to_eq('/coniditions/4')
    is_expected.to respond_with 200
    is_expectec.to have_content "Edit Weather"
    is_expected.to have_content weather.date.to_s
    is_expected.to have_content weather.max_temperature.to_s
    is_expected.to have_content weather.mean_temperature.to_s
    is_expected.to have_content weather.min_temperature.to_s
    is_expected.to have_content weather.mean_humidity.to_s
    is_expected.to have_content weather.mean_visibility.to_s
    is_expected.to have_content weather.mean_wind_speed.to_s
    is_expected.to have_content weather.precipitation.to_s
    is_expected.to have_content weather.zip_code.to_s
  end

  it "can post new weather" do
    context "with new content" do
      visit('/conditions')
      click_button("NEW")
      within("form") do
        fill_in :date, with "8/26/1993"
        fill_in :max_temperature, with "89.0"
        fill_in :mean_temperature, with "77.4"
        fill_in :min_temperature, with "33.6"
        fill_in :mean_humidity, with "5.6"
        fill_in :mean_visibility, with "55.4"
        fill_in :mean_wind_speed, with "34.2"
        fill_in :precipitation, with "3.2"
        fill_in :zip_code, with "80027"
        click_on "submit"
      end

      expect(current_path).to_eq('/conditions')
      expect(page).to have_content("8/26/1993")
      expect(page).to have_content("80027")
    end

    context "updating existing content"
      visit('/conditions')
      click_button("EDIT" match: :fifth)

      within("form") do
        ill_in :date, with "8/26/1993"
        fill_in :max_temperature, with "89.0"
        fill_in :mean_temperature, with "77.4"
        fill_in :min_temperature, with "33.6"
        fill_in :mean_humidity, with "5.6"
        fill_in :mean_visibility, with "55.4"
        fill_in :mean_wind_speed, with "34.2"
        fill_in :precipitation, with "3.2"
        fill_in :zip_code, with "80027"
        click_on "submit"
      end

      expect(current_path).to_eq('/conditions')
      expect(page).to have_content("8/26/1993")
      expect(page).to have_content("80027")
    end
  end

  it "can delete entry" do
    context "from main page" do
      visit('/conditions')
      click_on("DELETE" match: :first)

      expect(current_path).to_eq('/conditions')
      expect(page).to_not have_content("8/29/2013")
    end

    context "from individual weather page" do
      visit('/conditions')
      click_on("8/29/2013")
      click_on("DELETE")

      expect(current_path).to_eq('/conditions')
      expect(page).to_not have_content("8/29/2013")
    end
  end
end
