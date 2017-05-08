require './spec/spec_helper'

RSpec.describe "When a user views an individual condition" do
  before {
    zip = Zipcode.create(zipcode: "09000")
    condition = Condition.create(
                                date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                                max_temp: 87.0,
                                mean_temp: 76.0,
                                min_temp: 54.0,
                                mean_humidity: 90.0,
                                mean_visibility: 10.0,
                                mean_wind_speed: 11.0,
                                precipitation: 0,
                                zipcode_id: 1
                                )
    visit('/conditions/1')
  }
  it "they see the header with the date" do
    expect(page).to have_content("Weather Conditions on 08/30/2013")
  end

  it "they see details about condition" do
    expect(page).to have_content("Highest Temperature: 87.0")
    expect(page).to have_content("Mean Temperature: 76.0")
    expect(page).to have_content("Lowest Temperature: 54.0")
    expect(page).to have_content("Mean Humidity: 90.0")
    expect(page).to have_content("Mean Visibility: 10.0")
    expect(page).to have_content("Mean Wind Speed: 11.0")
    expect(page).to have_content("Precipitation: 0")
    expect(page).to have_content('Zipcode: 09000')
  end

  it "they see an edit button" do
    expect(page).to have_content("Edit Condition")
    expect(page).to have_css(".btn-edit")
  end

  it "they see a delete button" do
    expect(page).to have_button("Delete")
  end
end
