require_relative '../spec_helper'

RSpec.describe Station do
  describe "attributes" do
    it "should have a name, dock_count, city_id, install_date" do
      station = Station.new

      expect(station).to respond_to(:name, :dock_count, :city_id, :install_date)
    end
  end
end