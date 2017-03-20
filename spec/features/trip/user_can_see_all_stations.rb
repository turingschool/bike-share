require_relative "../../spec_helper"

RSpec.describe "when a user visits '/trips' " do

# show only 30 records per page limit(30) offset by 30 each page
# module pagination

  it "they can see all trips" do

  visit "/trips"

  expect(current_path).to eq("/trips")
  expect(page).to have_content("All Trips")
  expect(page).to have_content("Duration")
  expect(page).to have_content()

  end
end
