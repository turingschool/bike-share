require 'spec_helper'

describe "As a user, when I visit the home page" do
  before :each do
    visit '/'
  end

  it "I see Bike Share title" do
    expect(page.status_code).to eq(200)

    expect(page).to have_content("Bike Share")
  end

  it "I should also see a link to Station index" do
    click_link("Station Index")

    expect(current_path).to eq("/stations/index")
  end
end
