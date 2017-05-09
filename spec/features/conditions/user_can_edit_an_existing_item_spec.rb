require './spec/spec_helper'

RSpec.describe "When a user edits a condition" do
  before {
    zip = Zipcode.create(zipcode: "09000")
    zip_2 = Zipcode.create(zipcode: "90000")
    zip_3 = Zipcode.create(zipcode: "99000")
    condition = Condition.create(
                                date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                max_temp: 87.0,
                                mean_temp: 76.0,
                                min_temp: 54.0,
                                mean_humidity: 90.0,
                                mean_visibility: 10.0,
                                mean_wind_speed: 11.0,
                                precipitation: 0,
                                zipcode_id: zip_2.id
                                )
  }
  it "can edit all feilds" do
    visit('/conditions/1/edit')

    fill_in("condition[date]", with: "07/20/2013")
    fill_in("condition[max_temp]", with: 83.0)
    fill_in("condition[mean_temp]", with: 72.0)
    fill_in("condition[min_temp]", with: 62.0)
    fill_in("condition[mean_humidity]", with: 87.0)
    fill_in("condition[mean_visibility]", with: 9.0)
    fill_in("condition[mean_wind_speed]", with: 12.0)
    fill_in("condition[precipitation]", with: 0.01)
    select "09000", :from => "condition[zipcode_id]"

    click_button("Update Condition")

    expect(page).to have_content("Weather Conditions on 07/20/2013")
    expect(page).to have_content("Highest Temperature: 83.0 F")
    expect(page).to have_content("Mean Temperature: 72.0 F ")
    expect(page).to have_content("Lowest Temperature: 62.0 F")
    expect(page).to have_content("Mean Humidity: 87.0")
    expect(page).to have_content("Mean Visibility: 9.0 miles")
    expect(page).to have_content("Mean Wind Speed: 12.0 mph")
    expect(page).to have_content("Precipitation: 0.01 inches")
    expect(page).to have_content('Zipcode: 09000')
  end
  it "can skip editing zipcode field" do
    visit('/conditions/1/edit')

    click_button("Update Condition")

    expect(page).to have_content('Zipcode: 90000')
  end
end
