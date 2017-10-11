describe Trip do

  describe "Class Methods" do
    describe ".avg_duration" do
      it "returns the average duration of all trips in collection in a time format" do
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "Union Station",
                     end_station_id: "12",
                     bike_id: 215,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 98,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        expected = Time.at(50).utc.strftime("%H:%M:%S")


        expect(Trip.avg_duration).to eq(expected)
      end
    end

    describe ".longest_ride" do
      it "returns the duration of the longest ride in a time format" do
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "Union Station",
                     end_station_id: "12",
                     bike_id: 215,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 98,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        expected = Time.at(98).utc.strftime("%H:%M:%S")

        expect(Trip.longest_ride).to eq(expected)
      end
    end

    describe ".shortest_ride" do
      it "returns duration of shortest ride in time format" do
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "Union Station",
                     end_station_id: "12",
                     bike_id: 215,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 98,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        expected = Time.at(2).utc.strftime("%H:%M:%S")

        expect(Trip.shortest_ride).to eq(expected)
      end
    end

    describe ".most_departures" do
      it "returns the station with the most departures" do
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "Union Station",
                     end_station_id: "3",
                     bike_id: 215,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 98,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "12",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "3",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Trip.most_departures).to eq("San Jose Diridon Caltrain Station")
      end
    end

    describe ".most_arrivals" do
      it "returns the station with the most arrivals" do
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "Union Station",
                     end_station_id: "3",
                     bike_id: 215,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 98,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "12",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "3",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Trip.most_arrivals).to eq("Union Station")
      end
    end

  end
end
