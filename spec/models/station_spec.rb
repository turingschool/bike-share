require "./app/models/station"
require './spec/spec_helper'


RSpec.describe Station do
  describe "is valid" do

    before do
      @data = {
        dock_count: 5,
        city: "San Francisco",
        name: "bike pile",
        installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'),
        lat: 37.332808,
        long: -121.883890,
      }
    end

    it "with all data" do
      station = Station.new(@data)
      expect(station).to be_valid
    end

    context "not without property" do

      it "name" do
        @data.delete :name
        station = Station.new(@data)
        expect(station).to_not be_valid
      end

      it "city" do
        @data.delete :city
        station = Station.new(@data)
        expect(station).to_not be_valid
      end

      it "dock_count" do
        @data.delete :dock_count
        station = Station.new(@data)
        expect(station).to_not be_valid
      end

      it "installation_date" do
        @data.delete :installation_date
        station = Station.new(@data)
        expect(station).to_not be_valid
      end

      it "lat" do
        @data.delete :lat
        station = Station.new(@data)
        expect(station).to_not be_valid
      end

      it "long" do
        @data.delete :long
        station = Station.new(@data)
        expect(station).to_not be_valid
      end

    end

  end
end



















RSpec.describe Station do

  data = {
    dock_count: 5,
    city: "San Francisco",
    name: "bike pile",
    installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'),
    lat: 37.332808,
    long: -121.883890,
  }

  before do
    @data = data.dup
  end

  it "is valid with all required properties" do
    station = Station.new(@data)
    expect(station).to be_valid
  end

  context "is not not valid without property" do
    data.keys.each do |property|
      it(property) do
        @data.delete property
        station = Station.new(@data)
        expect(station).to_not be_valid
      end
    end
  end

end

















dummy_data = {
  Station => {
    dock_count: 5,
    city: "San Francisco",
    name: "bike pile",
    installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'),
    lat: 37.332808,
    long: -121.883890,
  }
}

dummy_data.each do |model, data|
  describe model do

    before do
      @data = data.dup
    end

    it "is valid with all required properties" do
      record = model.new(@data)
      expect(record).to be_valid
    end

    context "is not not valid without property" do
      data.keys.each do |property|
        it(property) do
          @data.delete property
          record = model.new(@data)
          expect(record).to_not be_valid
        end
      end
    end

  end
end
