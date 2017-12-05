require 'spec_helper'

describe "When a visitor visits the new trip page" do
  it "visitor sees new tip form" do

    visit '/trips/new'

    expect(page).to have_content("New Trip")
  end
end
