require 'spec_helper'

describe "When a visitor visits index" do
  it "visitor sees a full list of stations" do

    visit '/stations'

    expect(page).to have_content("Stations")
  end
end
