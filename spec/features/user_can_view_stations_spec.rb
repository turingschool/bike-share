require_relative '../spec_helper'

RSpec.describe "When a user visits '/stations'" do

  it "they see a list of stations" do

    visit '/stations'

    within("h2.title") do
      expect(page).to have_content("Stations")
    end

    within("li>a") do
      expect(page).to have_content("Turing Station")
    end
  end
end