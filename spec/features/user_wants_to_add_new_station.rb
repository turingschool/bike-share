require './spec/spec_helper'

RSpec.describe "user wants to add station" do
  it "visits the new station" do
    visit('/stations/new') do
      expect(page).to have_content("Add Station")
    end
  end

  
end