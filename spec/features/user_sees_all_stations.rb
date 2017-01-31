require_relative '../spec_helper'

RSpec.desribe "When a user visits '/'" do
  it "user sees all stations" do
    visit('/stations')
      expect(page).to [have something]
  end
end
