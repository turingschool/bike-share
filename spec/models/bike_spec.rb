require './app/models/bike'
require_relative '../spec_helper'

RSpec.describe Bike do
  describe 'validations' do
    it 'is valid with a bin' do
      bike = Bike.create(bin: 22)

      expect(bike).to be_valid
    end

    it 'is invalid without a bin' do
      bike = Bike.create

      expect(bike).to_not be_valid
    end

    it 'is invalid with a duplicate bin' do
      Bike.create(bin: 22)
      bike = Bike.create(bin: 22)

      expect(bike).to_not be_valid
    end
  end

  describe 'attributes' do
    it 'has a bin' do
      bike = Bike.new

      expect(bike).to respond_to(:bin)
    end
  end

  describe 'relationships' do
    it 'has many trips' do
      bike = Bike.create(bin: 22)

      trip1 = bike.trips.create(duration: 22, start_date: DateTime.new, end_date: DateTime.new, subscription_type: 'subscriber')
      trip2 = bike.trips.create(duration: 22, start_date: DateTime.new, end_date: DateTime.new, subscription_type: 'subscriber')

      expect(bike.trips).to include(trip1)
      expect(bike.trips).to include(trip2)
    end

    it 'belongs to a trip' do
      trip = Trip.create(duration: 22, start_date: DateTime.new, end_date: DateTime.new, subscription_type: 'subscriber')

      bike = trip.bike.create(bin: 22)

      expect(trip.bike).to be(bike)
    end
  end
end