require_relative '../spec_helper'

RSpec.describe Station do
  describe "attributes" do
    it "should have a name, dock_count, city_id, installation_date" do
      station = Station.new(name: "union station", dock_count: 12, city_id: 1, installation_date: 2/14/2014)

      expect(station).to respond_to(:name, :dock_count, :city_id, :installation_date)
    end
  end
end