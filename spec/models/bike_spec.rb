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
  end

  describe 'attributes' do
    it 'has a bin' do
      bike = Bike.new

      expect(bike).to respond_to(:bin)
    end
  end
end