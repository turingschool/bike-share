require_relative '../spec_helper'


RSpec.describe City do

  describe "validations" do
    it "is valid with a name" do
      city = City.create(name: "Denver")

      expect(city).to be_valid
    end

    it "is invalid without a name" do
      city = City.create(name: "")

      expect(city).to_not be_valid
    end

    it 'is invalid with a duplicate name' do
      City.create(name: "Sam Town")
      city = City.create(name: "Sam Town")

      expect(city).to_not be_valid
    end
  end

  describe "attributes" do
    it "should have a name" do
      city = City.new

      expect(city).to respond_to(:name)
    end
  end
end
