require './app/models/station.rb'

Station.destroy_all

Station.create(name: "Navy Pier", dock_count: "10", city: "Chicago", installation_date: "20160203")
Station.create(name: "Carl", dock_count: "107", city: "Seaver", installation_date: "20160204")
Station.create(name: "HelloStation", dock_count: "120", city: "Chicago", installation_date: "20160206")
