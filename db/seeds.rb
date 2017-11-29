require './app/models/station'
require 'date'

puts Station.create(name: "Mission", dock_count: 2, city: "SF", installation_date: Date.parse("2001-02-02"))
puts Station.create(name: "Haight Ashbury", dock_count: 2, city: "SF", installation_date: Date.parse("2010-02-02"))
puts Station.create(name: "Golden Gate Park", dock_count: 2, city: "SF", installation_date: Date.parse("2011-03-04"))