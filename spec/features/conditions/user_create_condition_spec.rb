require './spec/spec_helper'

RSpec.describe "when a user visits the new condition page" do
  it "they see instructions" do
    visit("/conditions/new")
    expect(page).to have_content("Add a new weather condition")
  end
  it "they can create a new condition" do
    zip = Zipcode.create(zipcode: "09000")

    expect(Condition.count).to eq 0

    visit('/conditions/new')
    expect(page).to have_css('input[type=submit]')
    fill_in("condition[date]", with: "08/30/2013")
    fill_in("condition[max_temp]", with: 75.0)
    fill_in("condition[mean_temp]", with: 70.0)
    fill_in("condition[min_temp]", with: 45.0)
    fill_in("condition[mean_humidity]", with: 70.0)
    fill_in("condition[mean_visibility]", with: 10.0)
    fill_in("condition[mean_wind_speed]", with: 10.0)
    fill_in("condition[precipitation]", with: 0.0)
    select "09000", :from => "condition[zipcode_id]"

    click_button("Create Weather Condition")

    expect(Condition.count).to eq 1
    expect(page).to have_current_path('/conditions/1')
    expect(page).to have_content('Weather Conditions on ')
    expect(page).to have_content('Precipitation: 0.0')
    expect(page).to have_content('Zipcode: 09000')
  end
end
