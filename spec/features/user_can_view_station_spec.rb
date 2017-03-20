require_relative '../spec_helper'
require 'pry'

RSpec.describe "A user can view station" do
  it "and has all content" do
    Station.create(name:'San Jose Diridon Caltrain Station', city: "San Jose", dock_count: 27, installation_date: "8/6/2013")
    visit '/stations/1'
    expect(page.all('li')[0].text).to eq("City: San Jose")
    expect(page.all('li')[1].text).to eq("Dock Count: 27")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
  end

  it "has an edit button" do
    Station.create(name:'San Jose Diridon Caltrain Station', city: "San Jose", dock_count: 27, installation_date: "8/6/2013")
    visit '/stations/1'
    expect(page).to have_button('Edit')
    page.click_link('', :href => '/stations/1/edit')
    expect(current_path).to eq('/stations/1/edit')
  end
end
