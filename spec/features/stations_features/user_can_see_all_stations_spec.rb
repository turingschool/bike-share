require './spec/spec_helper'

RSpec.describe "when a user visits the view all stations page (stations/index.erb)" do
  before do
    visit('/stations')
  end
  it "they can view an index of all stations" do
    expect(page).to have_content("All Stations")
    expect(page).to have_content("Add New Station")
    expect(page).to have_selector('a.btn-new')
  end

  context "when no stations exist yet" do
    it "they see a message that there are no stations if none are present" do
      expect(page).to have_content("No stations available.")
    end
  end

  context "when stations have been added" do
    before do
      city_1 = City.create(name: "squeevillia")
      Station.create!(
                    name: "something",
                    dock_count: 1,
                    city_id: 1,
                    installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                    longitude: -121.9,
                    latitude: 30.7
      )
      visit('/stations')
    end
    it "the page lists the added station's name" do
      # save_and_open_page
      expect(page).to have_content("something")
      expect(page).to have_selector(".station-title")
    end
    it "the page lists the added station's city name" do
      expect(page).to have_content("squeevillia")
    end
    it "the page lists the added station's view link" do
      expect(page).to have_selector(".station-title a")
      # can we test the href path on an anchor tag?
    end
    it "the page lists the added station's edit link" do
      expect(page).to have_content("Edit Station")
      expect(page).to have_selector(".btn-edit")
    end
    it "the page lists the added station's delete link" do
      expect(page).to have_selector("form .btn-delete")
    end
  end
end
