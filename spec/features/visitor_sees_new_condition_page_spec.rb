require 'spec_helper'

describe "When a visitor visits the new condition page" do
  it "visitor sees new condition form" do

    visit '/conditions/new'

    expect(page).to have_content("New Condition")
  end
end
