require 'spec_helper'

describe "When a visitor visits the new station page" do
  it "visitor sees new station form" do

    visit '/stations/new'

    expect(page).to have_content("New Station")
  end
end
