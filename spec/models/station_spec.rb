# require_relative '../spec_helper'
#
# RSpec.describe Station do
#   it "is not valid without a name" do
#     Station.create(dock_count: 12, city: "Denver", installation_date: "12-12-12")
#
#     expect(station).to_not be_valid
#   end
#
#   it "is not valid without a dock count" do
#     Station.create(name: "B-cycle", city: "Denver", installation_date: "12-12-12")
#
#     expect(station).to_not be_valid
#   end
#
#
#   it "is not valid without a city" do
#     Station.create(name: "B-cycle", dock_count: 12, installation_date: "12-12-12")
#
#     expect(station).to_not be_valid
#   end
#
#   it "is not valid without a installation date" do
#     Station.create(name: "B-cycle", dock_count: 12, city: "Denver")
#
#     expect(station).to_not be_valid
#   end
# end
