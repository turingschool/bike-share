require './spec/spec_helper'

RSpec.describe "When a user clicks delete" do

  it "deletes on the index" do
    zipcode = Zipcode.create(zipcode: 94127)
    trip = Trip.create(
                      start_date: DATE.strptime(“08/30/2013 11:11”, ‘%m/%d/%Y %H:%M’)
    )