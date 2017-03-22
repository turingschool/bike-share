require "./spec/spec_helper"

RSpec.describe "A city is created" do
	it "it exists" do
    city = City.new

    expect(city).to be_instance_of(City)
  end

  it "it has a name" do
    city = City.new(name: "Chicago")

    expect(city).to be_instance_of(City)
    binding.pry
  end

  it "a created city is saved in database" do
    city = City.create(name: "Chicago")

    expect(city).to be_instance_of(City)
    (City.count).equal(1)?
    binding.pry
  end


end
