require './spec/spec_helper'

RSpec.describe Station do
  describe ".average_available_bikes" do
    it "returns the average available bikes per station" do
      #Load data

      expect(Station.average_available_bikes).to eq(average_of_loaded)
    end
  end  
end
