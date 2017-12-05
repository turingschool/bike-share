require 'spec_helper'

describe "When a visitor visits trip index" do
  it "visitor sees list of trips" do

    visit '/trips'

    expect(page).to have_content("Trips")
  end
end
