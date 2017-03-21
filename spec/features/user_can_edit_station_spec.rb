require_relative '../spec_helper'

RSpec.describe "A user sees a form" do
  before(:each) { Station.create(name: "Denver Station", city: "Denver", dock_count: 25, installation_date: "8/6/2013")}
  # it "that has name, city, dock count, and installation date" do
  #   visit '/stations/1/edit'
  #   fill_in "station[name]", with: "Denver Station Edited"
  #   fill_in "station[city]", with: "Denver Edited"
  #   fill_in "station[dock_count]", with: 55
  #   fill_in "station[installation_date]", with: "8/7/2017"
  #   click_on "Update Station"
  #   expect(current_path).to eq("/stations/1")
  #     expect(page).to have_content("Denver Station Edited")
  #     expect(page).to have_content("City: Denver Edited")
  #     expect(page).to have_content("Age: 55")
  #     expect(page).to have_content("Installation Date: 2016-05-08")
  # end

  it "that has name, city, dock count, and installation date" do
    visit '/stations/1/edit'
    fill_in "station[name]", with: "Denver Station Edited"
    fill_in "station[city]", with: "Denver Edited"
    fill_in "station[dock_count]", with: 55
    fill_in "station[installation_date]", with: "8/7/2017"
    click_on "Update Station"

      expect(current_path).to eq("/stations")
      expect(page).to have_content("Denver Station Edited")
      expect(page).to have_content("Denver Edited")
      expect(page).to have_content("55")
      expect(page).to have_content("2017-07-08")
  end
end
