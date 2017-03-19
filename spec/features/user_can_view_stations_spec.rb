require_relative '../spec_helper'

RSpec.describe "When a user visits '/stations'" do

  it "they see a list of stations" do

    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))

    visit '/stations'

    within("h2.title") do
      expect(page).to have_content("Stations")
    end

    within("li>a") do
      expect(page).to have_content("Turing Station")
    end
  end
end
