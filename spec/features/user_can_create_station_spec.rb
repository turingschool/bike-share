require './spec/spec_helper'

RSpec.describe "when a user visits the new station page" do
  it "they can create a new station" do
    city_1 = City.create(name: "squeevillia")
    city_2 = City.create(name: "rhondarhiffic")
    city_3 = City.create(name: "chrissable")
    city_4 = City.create(name: "adamtastic")

    expect(Station.all.count).to eq(0)

    visit('/stations/new')
    expect(page).to have_content("Add a new station")
    fill_in("station[name]", with: "Something")
    select "squeevillia", :from => "station[city_id]"
    fill_in("station[dock_count]", with: 1)
    # installation date (should eventually be a datepicker)
    fill_in("station[installation_date]", with: "08/30/2013")
    fill_in("station[latitude]", with: -1.1)
    fill_in("station[longitude]", with: 1.1)

    click_button("Create Station")

    expect(Station.all.count).to eq(1)
    expect(page).to have_content("Name: Something")
    expect(page).to have_current_path("/stations/1")
    expect(page).to have_content("City: squeevillia")


  end
end
