require_relative '../spec_helper'

#As a user when I fill out Create new station form
#and then i click submit
#i expect to be redirected to the page for the new station


RSpec.describe "user can click the submit button on a form" do
  it "will redirect to the page for that individual station" do
    City.create(name: "Rockville")

    visit('/stations/new')
    fill_in "Name", with: "MLK"
    fill_in "Dock Count", with: 22
    fill_in "City", with: "Rockville"
    fill_in "Installation Date", with: "1776-9-12"
    click_on "Submit"

    expect(current_path).to eq("/stations/1")
    expect(page).to have_content("Rockville")
    expect(page).to have_content("MLK")
  end
end
