require_relative "../spec_helper"

RSpec.describe Station do
  describe "knows name" do
    it "returns station name" do
      Station.create(name: "Denver Station", city: "Denver", dock_count: 25, installation_date: "8/6/2013")
    end
  end
  describe "knows city" do
      Station.create(name: "Denver Station", city: "Denver", dock_count: 25, installation_date: "8/6/2013")

  end
  describe "knows dock count" do
      Station.create(name: "Denver Station", city: "Denver", dock_count: 25, installation_date: "8/6/2013")
  end
  describe "knows installation date" do
      Station.create(name: "Denver Station", city: "Denver", dock_count: 25, installation_date: "8/6/2013")
  end
end