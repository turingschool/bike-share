require_relative "../../spec_helper"

RSpec.describe "as a user deletes an existing station from all stations page" do
  it "they can see existing station data and delete the station record" do
    city = City.create(city: "Denver")
    station = city.stations.create(name: "Japantown", dock_count: 15, city_id: 1, installation_date: "2013-08-05")

    # as a user
    # when i visit /stations
    visit "/stations"
    # and i see my existing station data on screen
    # and i click on the 'delete station' button? link on end of line?
    # then the station is deleted
    click_on "Delete Station"
    # and I am redirected to the updated stations list where I will
    expect(current_path).to eq("/stations")
    # not see the deleted station data any longer
    expect(page).to_not have_content(station.name)
  end
end


# test a bigger data set
# 2 cities, 2 stations - figure out how to determine button interaction/solf the ambiguous-type issue
# 
