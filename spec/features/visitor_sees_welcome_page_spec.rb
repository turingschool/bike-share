require 'spec_helper'

describe "When a visitor visits welcome/root path" do
  it "visitor sees a welcome message" do

    visit '/'

    expect(page).to have_content("BayCycle")
  end
end
