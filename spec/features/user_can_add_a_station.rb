require_relative '../spec_helper'

RSpec.desribe "When a user visits '/stations/new'" do
  it "they see a screen to input data" do
    visit('/stations/new')

  end
end
