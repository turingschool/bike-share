require_relative "../spec_helper"

RSpec.describe "Editing a station" do
  it "Can click button and be taken to corresponding page" do
    Station.create(name: "Navy Pier", city: "Chicago", dock_count: "12", installation_date: "20150505")
    visit "/stations"

    click_on "Edit"

    expect(current_path).to eq("/stations/1/edit")
  end
end
