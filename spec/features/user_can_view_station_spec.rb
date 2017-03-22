require_relative '../spec_helper'
require 'pry'

RSpec.describe "A user can view station" do
  before(:each) do
    Station.create(name: "Denver Station", city_id: 1, dock_count: 25, installation_date: "8/6/2013")
    City.create(name: "Denver")
   end
  it "and has all content" do
    visit '/stations/1'
    within("ul li:nth-child(1)") do
      expect(page).to have_content("City: Denver")
    end
    within("ul li:nth-child(2)") do
      expect(page).to have_content("Dock Count: 25")
    end
    within("ul li:nth-child(3)") do
      expect(page).to have_content("Installation Date: 2013-06-08")
    end
  end

  it "has an edit button" do
    visit '/stations/1'
    expect(page).to have_button('Edit')
    page.click_link('', :href => '/stations/1/edit')
    expect(current_path).to eq('/stations/1/edit')
  end

  it "has an delete button" do
    visit '/stations/1'
    expect(page).to have_button('Delete')
    click_on "Delete"
    expect(current_path).to eq('/stations')
  end
end
