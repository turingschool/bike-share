require './spec/spec_helper'

RSpec.describe Station do
  describe "validations" do
    it "can make valid objects" do
      station = Station.new(name: "Broadway", dock_count: 12, lat: 1.2325, long: 12.54683, the_date_id: 2, city_id: 1)

      expect(station).to be_valid
    end
  end
end

