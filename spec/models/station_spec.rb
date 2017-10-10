require "./app/models/station"
require './spec/spec_helper'

dummy_data = {
  Station => {
    dock_count: 5,
    city: "San Francisco",
    name: "bike pile",
    installation_date: Date.strptime("8/15/2017", '%m/%d/%Y'),
    lat: 37.332808,
    long: -121.883890
    }
  }
