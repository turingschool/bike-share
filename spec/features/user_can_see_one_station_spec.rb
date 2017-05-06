require './spec/spec_helper'

RSpec.describe "when a user visits the view station page" do

  it "they can view information about a station" do
    visit('/stations/1')
    expect(page).to have_content("Name: Something")
    expect(page).to have_content("Edit Station")
    expect(page).to have_selector(".btn-delete")
  end
end
