require "./app/models/station"
require './spec/spec_helper'


RSpec.describe Station do
  # require "pry"; binding.pry

  describe 'with_most_bikes' do
    it "returns empty for for empty collection" do
      expect(Station.with_most_bikes).to be_empty
    end

    it "returns one-length array if not tied" do
      max = Station.create!(name: "Station 42", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      Station.create!(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)

      found = Station.with_most_bikes

      expect(found).to eq [max]
    end

    it "returns multiple stations if tied" do
      max_1 = Station.create!(name: "a", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      max_2 = Station.create!(name: "b", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)

      found = Station.with_most_bikes.sort_by &:name

      expect(found).to eq [max_1, max_2]
    end
  end

  describe 'with_least_bikes' do
    it "returns empty for for empty collection" do
      expect(Station.with_least_bikes).to be_empty
    end

    it "returns one-length array if not tied" do
      min = Station.create!(name: "Station 42", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      Station.create!(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)

      found = Station.with_least_bikes

      expect(found).to eq [min]
    end

    it "returns multiple stations if tied" do
      max_1 = Station.create!(name: "a", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      max_2 = Station.create!(name: "b", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)

      found = Station.with_least_bikes.sort_by &:name

      expect(found).to eq [max_1, max_2]
    end
  end

  describe 'newest' do
    it "returns empty for for empty collection" do
      expect(Station.newest).to be_empty
    end

    it "returns one-length array if not tied" do
      most_recent = Station.create!(installation_date: Date.strptime("8/16/2017", '%m/%d/%Y'), name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)

      found = Station.newest

      expect(found).to eq [most_recent]
    end

    it "returns multiple stations if tied" do
      most_recent_1 = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "a", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      most_recent_2 = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "b", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)

      found = Station.newest.sort_by &:name

      expect(found).to eq [most_recent_1, most_recent_2]
    end

  end

  describe 'oldest' do

    it "returns empty for for empty collection" do
      expect(Station.oldest).to be_empty
    end

    it "returns one-length array if not tied" do
      least_recent = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      Station.create!(installation_date: Date.strptime("8/16/2017", '%m/%d/%Y'), name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)

      found = Station.oldest

      expect(found).to eq [least_recent]
    end

    it "returns multiple stations if tied" do
      least_recent_1 = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "a", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      least_recent_2 = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "b", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)

      found = Station.oldest.sort_by &:name

      expect(found).to eq [least_recent_1, least_recent_2]
    end

  end

  describe "is valid" do
    before do
      @data = {
        dock_count: 5,
        city: "San Francisco",
        name: "bike pile",
        installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'),
        lat: 37.332808,
        long: -121.883890
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



















# RSpec.describe Station do
#
#   data = {
#     dock_count: 5,
#     city: "San Francisco",
#     name: "bike pile",
#     installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'),
#     lat: 37.332808,
#     long: -121.883890,
#   }
#
#   before do
#     @data = data.dup
#   end
#
#   it "is valid with all required properties" do
#     station = Station.new(@data)
#     expect(station).to be_valid
#   end
#
#   context "is not not valid without property" do
#     data.keys.each do |property|
#       it(property) do
#         @data.delete property
#         station = Station.new(@data)
#         expect(station).to_not be_valid
#       end
#     end
#   end
#
# end
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# dummy_data = {
#   Station => {
#     dock_count: 5,
#     city: "San Francisco",
#     name: "bike pile",
#     installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'),
#     lat: 37.332808,
#     long: -121.883890,
#   }
# }
#
# dummy_data.each do |model, data|
#   describe model do
#
#     before do
#       @data = data.dup
#     end
#
#     it "is valid with all required properties" do
#       record = model.new(@data)
#       expect(record).to be_valid
#     end
#
#     context "is not not valid without property" do
#       data.keys.each do |property|
#         it(property) do
#           @data.delete property
#           record = model.new(@data)
#           expect(record).to_not be_valid
#         end
#       end
#     end
#
#   end
# end
