require 'spec_helper'

describe "When a visitor visits welcome/root path" do
  it "visitor sees home page" do

    visit '/'

    expect(page).to have_content("BayCycle")
    expect(page).to have_content("Stations")
  end
end
