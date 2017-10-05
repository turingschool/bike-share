require "./app/models/station.rb"
require './spec/spec_helper'

RSpec.describe Station do
  describe "Validations" do

    it "is invalid without a name" do
      station = Station.new(dock_count: 5, city: "San Francisco", installation_date: "08/15/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "Station 42", city: "San Francisco", installation_date: "08/15/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end


    it "is invalid without a city" do
      station = Station.new(name: "Station 42", dock_count: 5, installation_date: "08/15/2017", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a installation date" do
      station = Station.new(name: "Station 42", dock_count: 5, city: "San Francisco", lat: 0, long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a latitute" do
      station = Station.new(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: "08/15/2017", long: 0)
      expect(station).to_not be_valid
    end

    it "is invalid without a longitude" do
      station = Station.new(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: "08/15/2017", lat: 0)
      expect(station).to_not be_valid
    end

    it "is valid with all data" do
      station = Station.new(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      # require "pry"; binding.pry
      expect(station).to respond_to(:class)
    end

  end

  describe 'with_most_bikes' do

    it "returns empty array for for empty collection" do
      expect(Station.with_most_bikes).to be_nil
    end

    it "returns one-length array if not tied" do
      max = Station.create!(name: "Station 42", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      Station.create!(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)

      found = Station.with_most_bikes.to_a

      expect(found).to be_eq [max]
    end

    it "returns multiple stations if tied" do
      max_1 = Station.create!(name: "a", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      max_2 = Station.create!(name: "b", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)

      found = Station.with_most_bikes.to_a.sort_by &:name

      expect(found).to be_eq [max_1, max_2]
    end

  end

  describe 'with_least_bikes' do

    it "returns empty array for for empty collection" do
      expect(Station.with_least_bikes).to be_nil
    end

    it "returns one-length array if not tied" do
      min = Station.create!(name: "Station 42", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      Station.create!(name: "Station 42", dock_count: 5, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)

      found = Station.with_least_bikes.to_a

      expect(found).to be_eq [min]
    end

    it "returns multiple stations if tied" do
      max_1 = Station.create!(name: "a", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)
      max_2 = Station.create!(name: "b", dock_count: 6, city: "San Francisco", installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), lat: 37.332808, long: -121.88389099999999)

      found = Station.with_least_bikes.to_a.sort_by &:name

      expect(found).to be_eq [max_1, max_2]
    end

  end

  describe 'newest' do

    it "returns empty array for for empty collection" do
      expect(Station.newest).to be_nil
    end

    it "returns one-length array if not tied" do
      most_recent = Station.create!(installation_date: Date.strptime("8/16/2017", '%m/%d/%Y'), name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)

      found = Station.newest.to_a

      expect(found).to be_eq [most_recent]
    end

    it "returns multiple stations if tied" do
      most_recent_1 = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "a", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      most_recent_2 = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "b", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)

      found = Station.newest.to_a.sort_by &:name

      expect(found).to be_eq [most_recent_1, most_recent_2]
    end

  end

  describe 'oldest' do

    it "returns empty array for for empty collection" do
      expect(Station.oldest).to be_nil
    end

    it "returns one-length array if not tied" do
      least_recent = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      Station.create!(installation_date: Date.strptime("8/16/2017", '%m/%d/%Y'), name: "Station 42", dock_count: 5, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)

      found = Station.oldest.to_a

      expect(found).to be_eq [least_recent]
    end

    it "returns multiple stations if tied" do
      least_recent_1 = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "a", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)
      least_recent_2 = Station.create!(installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'), name: "b", dock_count: 6, city: "San Francisco", lat: 37.332808, long: -121.88389099999999)

      found = Station.oldest.to_a.sort_by &:name

      expect(found).to be_eq [least_recent_1, least_recent_2]
    end

  end
