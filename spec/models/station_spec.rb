require "./app/models/station.rb"
require './spec/spec_helper'

RSpec.describe Station do
  describe "Validations" do

    it "is invalid without a name" do
      station = Station.new(dock_count: 5, city: "San Francisco", installation_date: "1/1/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "Station 42", city: "San Francisco", installation_date: "1/1/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end


    it "is invalid without a city" do
      station = Station.new(name: "Station 42", dock_count: 5, installation_date: "1/1/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a installation date" do
      station = Station.new(name: "Station 42", dock_count: 5, city: "San Francisco", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a latitute" do
      station = Station.new(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: "1/1/2017", long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a longitude" do
      station = Station.new(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: "1/1/2017", lat: 0)
      expect(station).to_not be_valid
    end

    it "is valid with all data" do
      station = Station.new(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      # require "pry"; binding.pry
      expect(station).to respond_to(:class)
    end

  end

  describe 'with_most_bikes' do

    it "returns empty array for for empty collection" do
      expect(Station.with_most_bikes).to be_nil
    end

    it "returns one-length array if not tied" do
            Station.create!(dock_count: 5, name: "Station 42", city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      max = Station.create!(dock_count: 6, name: "Station 42", city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      found = Station.with_most_bikes.to_a

      expect(found).to be_eq [max]
    end

    it "returns multiple stations if tied" do
      tied_1 = Station.create!(dock_count: 6, name: "a", city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      tied_2 = Station.create!(dock_count: 6, name: "b", city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      found = Station.with_most_bikes.to_a.sort_by &:name

      expect(found).to be_eq [tied_1, tied_2]
    end

  end

  describe 'with_least_bikes' do

    it "returns empty array for for empty collection" do
      expect(Station.with_least_bikes).to be_nil
    end

    it "returns one-length array if not tied" do
            Station.create!(dock_count: 6, name: "Station 42", city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      min = Station.create!(dock_count: 5, name: "Station 42", city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      found = Station.with_least_bikes.to_a

      expect(found).to be_eq [min]
    end

    it "returns multiple stations if tied" do
      tied_1 = Station.create!(dock_count: 6, name: "a", city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      tied_2 = Station.create!(dock_count: 6, name: "b", city: "San Francisco", installation_date: "1/1/2017", lat: 37.332808, long: -121.88389099999999)
      found = Station.with_least_bikes.to_a.sort_by &:name

      expect(found).to be_eq [tied_1, tied_2]
    end

  end

  describe 'newest' do

    it "returns empty array for for empty collection" do
      expect(Station.newest).to be_nil
    end

    it "returns one-length array if not tied" do
              Station.create!(installation_date: "1/1/2017", name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      newer = Station.create!(installation_date: "2/1/2017", name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      found = Station.newest.to_a

      expect(found).to be_eq [newer]
    end

    it "returns multiple stations if tied" do
      tied_1 = Station.create!(installation_date: "1/1/2017", name: "a", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      tied_2 = Station.create!(installation_date: "1/1/2017", name: "b", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      found = Station.newest.to_a.sort_by &:name

      expect(found).to be_eq [tied_1, tied_2]
    end

  end

  describe 'oldest' do

    it "returns empty array for for empty collection" do
      expect(Station.oldest).to be_nil
    end

    it "returns one-length array if not tied" do
              Station.create!(installation_date: "1/1/2017", name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      older = Station.create!(installation_date: "1/1/2016", name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      found = Station.oldest.to_a

      expect(found).to be_eq [older]
    end

    it "returns multiple stations if tied" do
      tied_1 = Station.create!(installation_date: "1/1/2017", name: "a", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      tied_2 = Station.create!(installation_date: "1/1/2017", name: "b", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      found = Station.oldest.to_a.sort_by &:name

      expect(found).to be_eq [tied_1, tied_2]
    end

  end
