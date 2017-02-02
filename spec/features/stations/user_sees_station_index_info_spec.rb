require_relative '../../spec_helper'

RSpec.describe "When a user visits /stations" do
  it "they see a header indicating trips results" do
      visit '/stations'

  expect(page).to have_content("All Stations")
  end
end
