require './spec/spec_helper'

RSpec.describe City do
  it "has a name attribute" do
    city = City.create(name:"squeevillia")

    expect(city.id).to eq 1
    expect(city.name).to eq "squeevillia"
  end
end
