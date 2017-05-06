require './spec/spec_helper'


RSpec.describe Station do
  describe "it exists" do
    it "is class Station" do
      expect(Station.new.class).to be Station
    end
  end
end
