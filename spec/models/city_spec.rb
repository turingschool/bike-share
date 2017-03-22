require "./spec/spec_helper"

RSpec.describe "A city is created" do
	it "it exists" do
    city = City.new
    expect(city).to be_instance_of(City)
  end

  it "a city has a name" do
    city = City.new(name: "Chicago")
    (city.name).equal?("Chicago")
  end

  it "a city without a name is not saved in database" do
    city = City.create
    expect(city).to be_instance_of(City)
    (City.count).equal?(0)
  end

  it "a created city is saved in database" do
    city = City.create(name: "Chicago")
    expect(city).to be_instance_of(City)
    (City.count).equal?(1)
  end

  it "a city with a duplicate name is not saved in database" do
    City.create(name: "Chicago")
    City.create(name: "Chicago")
    City.create(name: "Chicago")

    (City.count).equal?(1)
  end

  it "a second city can be added" do
    City.create(name: "New York")

    (City.count).equal?(2)
  end

  it "a city has a name" do
    city = City.first

    (city.name).equal?("Chicago")
  end

end
