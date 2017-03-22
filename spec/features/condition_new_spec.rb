require_relative '../spec_helper'

RSpec.describe "when a user visits /conditions/new" do
  it "they can create a new condition" do
    visit "conditions/new"
    fill_in "condition[date]", with: "29/8/2013"
    fill_in "condition[max_temp]", with: 75.0
    fill_in "condition[mean_temp]", with: 68.0
    fill_in "condition[min_temp]", with: 61.0
    fill_in "condition[mean_humidity]", with: 70.0
    fill_in "condition[mean_visibility]", with: 10.0
    fill_in "condition[mean_wind]", with: 11.0
    fill_in "condition[precipitation]", with: 0.0
    click_on "Submit"

    expect(current_path).to eq("/conditions")


    expect(page).to have_content("75.0")

  end
end