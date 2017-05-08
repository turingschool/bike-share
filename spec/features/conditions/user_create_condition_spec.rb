require './spec/spec_helper'
require './spec/features/stations/controller_helper'

RSpec.describe "when a user visits the new condition page" do
  it "they see instructions" do
    visit("/conditions/new")
    expect(page).to have_content("Add a new weather condition")
  end
  it ""
end
