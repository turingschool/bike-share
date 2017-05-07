require './spec/spec_helper'

RSpec.describe "when a user visits the view station page" do
  before do
    city_1 = City.create(name: "squeevillia")
    city_2 = City.create(name: "rhondarhiffic")
    city_3 = City.create(name: "chrissable")
    city_4 = City.create(name: "adamtastic")
    
    Station.create!(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: -121.9,
                  latitude: 30.7
    )
  end

  it "they can view information about a station" do
    visit('/stations/1')

    expect(page).to have_content("something")
    expect(page).to have_content("Edit Station")
    expect(page).to have_selector(".btn-edit")

    expect(page).to have_selector("form .btn-delete")
  end
end
