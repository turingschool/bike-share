require_relative '../spec_helper'

RSpec.describe "Clicking Delete removes station from list" do
  it "Can delete stations from list" do
    City.create(name: "Chicago")
    Station.create(name:"Navy Pier", dock_count:"12", city_id: 1, installation_date: "20170101")
    visit '/stations'

    expect(page).to have_content("Navy Pier")

    click_on "Delete"

    expect(page).to_not have_content("Navy Pier")
  end
end
