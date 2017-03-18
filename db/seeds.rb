require './app/models/station.rb'

Station.create!(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', dock_count: 12, city: 'Denver', installation_date: Date.parse('8/6/2013'))
