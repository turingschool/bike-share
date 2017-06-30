require './app/models/station.rb'

Station.create!(name: 'Turing Station', dock_count: 12, city: 'Denver', installation_date: Date.parse('8/6/2013'))