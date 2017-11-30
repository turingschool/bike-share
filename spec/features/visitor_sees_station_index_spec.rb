require 'spec_helper'

describe "When a visitor visits welcome/root path" do
  it "visitor sees a welcome message" do

    visit '/stations'

    expect(page).to have_content("All Stations")
  end
end
