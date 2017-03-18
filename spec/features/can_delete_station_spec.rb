require_relative '../spec_helper'

RSpec.describe "Clicking Delete removes station from list" do
  it "Can delete stations from list" do
    Station.create(name:"Navy Pier", dock_count:"12", city:"Chicago", installation_date: "20170101")
    visit '/stations'

    expect(page).to have_content("Navy Pier")

    click_on "Delete"

    expect(page).to_not have_content("Navy Pier")
  end
end
