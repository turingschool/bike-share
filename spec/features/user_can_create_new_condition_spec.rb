require_relative '../spec_helper'

RSpec.describe "As a user tries to create a condition" do
  it "they can enter condition attributes and be redirected to see new content on next page" do
    visit '/conditions/new'
    fill_in "condition[date]", with: "8/7/2015"
    fill_in "condition[max_temp]", with: 110
    fill_in "condition[min_temp]", with: 88
    fill_in "condition[mean_temp]", with: 90
    fill_in "condition[mean_humidity]", with: 4
    fill_in "condition[mean_visibility]", with: 2
    fill_in "condition[mean_wind_speed]", with: 5
    fill_in "condition[precipitation]", with: 0
    click_on "Submit"

    expect(current_path).to eq("/conditions/page/1")
    expect(page).to have_content("2015-07-08")
    expect(page).to have_content("110")
    expect(page).to have_content("88")
    expect(page).to have_content("90")
    expect(page).to have_content("4")
    expect(page).to have_content("2")
    expect(page).to have_content("5")
    expect(page).to have_content("0")
  end
end
