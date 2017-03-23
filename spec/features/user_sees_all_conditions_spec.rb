require_relative "../spec_helper"
require 'pry'


RSpec.describe "User sees all content" do
  before(:each) { Condition.create(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0) }
  it "and has one of the conditions and all header names" do
      visit "/conditions"
      expect(page).to have_content("Date")
      expect(page).to have_content("Max Temp")
      expect(page).to have_content("Min Temp")
      expect(page).to have_content("Mean Humidity")
      expect(page).to have_content("Mean Visibility")
      expect(page).to have_content("Mean Wind Speed")
      expect(page).to have_content("Precipitation")
      expect(page).to have_content("2015-07-08")
      expect(page).to have_content("88")
      expect(page).to have_content("55")
      expect(page).to have_content("70")
      expect(page).to have_content("3")
      expect(page).to have_content("4")
      expect(page).to have_content("1")
      expect(page).to have_content("0")

  end

  it "and has a create new condition button that links to correct route" do
    visit "/conditions"
    page.click_link('', :href => '/conditions/new')
    expect(current_path).to eq("/conditions/new")
  end

  it "they can click on a condition name and be redirected to that condition" do
    visit '/conditions'
      click_on("2015-07-08")
      expect(current_path).to eq("/conditions/1")
  end

  it "and has a view dashboard button that links to correct route" do
    visit "/conditions"
    page.click_link('', :href => '/condition-dashboard')
    expect(current_path).to eq('/condition-dashboard')
  end

end
