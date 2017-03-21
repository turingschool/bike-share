require_relative '../spec_helper'
require 'pry'

RSpec.describe "A user can view condition" do
  before(:each) { Condition.create(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0) }
  it "and has all content" do
    visit '/conditions/1'

    within('h2') do
      expect(page).to have_content("2015-07-08")
    end

    within("ul li:nth-child(1)") do
      expect(page).to have_content("Maximum Temp: 88")
    end
    within("ul li:nth-child(2)") do
      expect(page).to have_content("Minimum Temp: 55")
    end
    within("ul li:nth-child(3)") do
      expect(page).to have_content("Mean Temp: 70")
    end
    within("ul li:nth-child(4)") do
      expect(page).to have_content("Mean Humidity: 3")
    end
    within("ul li:nth-child(5)") do
      expect(page).to have_content("Mean Visibility: 4")
    end
    within("ul li:nth-child(6)") do
      expect(page).to have_content("Mean Wind Speed: 1")
    end
    within("ul li:nth-child(7)") do
      expect(page).to have_content("Precipitation: 0")
    end
  end

  it "has an edit button" do
    visit '/conditions/1'
    expect(page).to have_button('Edit')
    page.click_link('', :href => '/conditions/1/edit')
    expect(current_path).to eq('/conditions/1/edit')
  end

  it "has an delete button" do
    visit '/conditions/1'
    expect(page).to have_button('Delete')
    click_on "Delete"
    expect(current_path).to eq('/conditions')
  end
end
