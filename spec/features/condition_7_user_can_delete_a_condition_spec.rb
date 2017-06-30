require_relative '../spec_helper'

RSpec.describe "user can delete a station" do
  it "takes you to view all page and entry is deleted" do
    Condition.create(date: "2013-11-22",
                                 max_temperature: 70,
                                 mean_temperature: 60,
                                 min_temperature: 50,
                                 mean_humidity: 20,
                                 mean_visibility: 2,
                                 mean_wind_speed: 10,
                                 precipitation: 12)
    visit("/conditions/1")

    click_on "Delete"
    expect(current_path).to eq("/conditions/view_all")
    expect(page).to_not have_content("2013-11-22")
  end
end
