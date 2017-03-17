require_relative "../spec_helper"

RSpec.describe "User sees all stations" do
  it "and has one of the stations and all header names" do
    visit "/bike_share/stations"

    within("th") do  #look in the header element to see if we have these values
        expect(page).to have_content("Name")
        expect(page).to have_content("Dock Count")
        expect(page).to have_content("City")
        expect(page).to have_content("Installation Date")
    end

    within("td") do #look in the table values to see if these are present attributes
    expect(page).to have_content("San Jose Diridon Caltrain Station")
    expect(page).to have_content("27")
    expect(page).to have_content("San jose")
    expect(page).to have_content("8/6/2013")
    end
  end
end
