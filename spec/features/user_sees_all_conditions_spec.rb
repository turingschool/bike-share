describe "user travels to conditions URI '/conditions'" do
  it "gets you to the conditions index view" do
    visit '/conditions'

    within("h1") do
      expect(page).to have_content("All Conditions")
    end
  end
end

describe "user clicks on date of entry" do
  it "gets you to the shw page for that entry" do
    Condition.create({date: "2013-08-29",
      min_temperature_f: 10,
      max_temperature_f: 20,
      mean_temperature_f: 15,
      mean_humidity: 50,
      mean_visibility_miles: 20,
      mean_wind_speed_mph: 5,
      precipitation_inches: 0
        })
    visit '/conditions'
    click_link("2013-08-29")

    has_link?("All Conditions")
    within("h1") do
      expect(page).to have_content("2013-08-29")
    end
  end
end
