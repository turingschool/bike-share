require 'spec_helper'

describe "when user visits /conditions path" do
  it "sees a condition index page with all dates and link to home" do
     visit '/conditions'

     expect(page).to have_content("Weather Conditions")
     expect(page).to have_link("Home", :href=>'/')
  end

  it "sees 30 dates with forward and delete buttons" do
    30.times do Condition.create(date: DateTime.now,
                                max_temperature_f: 20.0,
                                mean_temperature_f: 30.0,
                                min_temperature_f: 10.0,
                                mean_humidity: 35.0,
                                mean_visibility_miles: 10,
                                mean_wind_speed_mph: 55,
                                precipitation_inches: 4,)
    end

    visit '/conditions'

    expect(page).to have_selector('ol li', count: 30)
    expect(page).to have_content("2017")
    expect(page).to have_link("Forward")
    expect(page).to have_button("delete")
    # within(".delete") do
    #   first('.delete').click_link('delete_button')
    # end

    # expect(current_path).to eq('/conditions')
    # expect {click_button(first("destroy"))}.to change(Condition, :count).by(-1)
  end
end
