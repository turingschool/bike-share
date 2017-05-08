require './spec/spec_helper'

RSpec.describe "When a user clicks delete" do
  it "on the index" do
    zip = Zipcode.create(zipcode: "09000")
    condition = Condition.create!(
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

    visit('/conditions')

    expect(page).to have_button("Delete")
    expect(Condition.all.count).to eq(1)
    click_button("Delete")

    expect(Condition.all.count).to eq(0)
    expect(page).to have_current_path("/conditions")
  end

  it "on the edit page" do
    zip = Zipcode.create(zipcode: "09000")
    condition = Condition.create!(
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

    visit('/conditions/1/edit')

    expect(page).to have_button("Delete")
    expect(Condition.all.count).to eq(1)
    click_button("Delete")

    expect(page).to have_current_path("/conditions")
    expect(Condition.all.count).to eq(0)
  end

  it "on the show page" do
    zip = Zipcode.create(zipcode: "09000")
    condition = Condition.create!(
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

    expect(page).to have_button("Delete")
    expect(Condition.all.count).to eq(1)
    click_button("Delete")

    expect(page).to have_current_path("/conditions")
    expect(Condition.all.count).to eq(0)
  end
end
