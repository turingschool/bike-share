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

    describe ".month_year_breakdown" do
      it "returns an array including month year and total trip count" do
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
                     start_date: Date.strptime("1/6/2017", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 1000,
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
        expected = [["August 2016", 2], ["January 2017", 1]]

        expect(Trip.month_year_breakdown).to eq(expected)
      end
    end

    describe ".year_breakdown" do
      it "returns an array including year and total trip count" do
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
                     start_date: Date.strptime("1/6/2017", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 1000,
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
        expected = [["2016", 2], ["2017", 1]]

        expect(Trip.year_breakdown).to eq(expected)
      end
    end

    describe ".most_ridden_bike" do
      it "returns the bike id of the most ridden bike" do
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
                     start_date: Date.strptime("1/6/2017", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 1000,
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

        expect(Trip.most_ridden_bike).to eq(989)
      end
    end

    describe ".least_ridden_bike" do
      it "returns the bike id of the least ridden bike" do
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
                     start_date: Date.strptime("1/6/2017", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 1000,
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

        expect(Trip.least_ridden_bike).to eq(215)
      end
    end

    describe ".ride_count" do
      it "returns the the ride count of a given bike_id" do
        Trip.create({duration: 98,
                     start_date: Date.strptime("1/6/2017", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 1000,
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

        expect(Trip.ride_count(989)).to eq(2)
      end
    end

    describe ".subscription_types_and_info" do
      it "returns hash of subcription as key and a info hash as a value" do
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "Union Station",
                     end_station_id: "3",
                     bike_id: 215,
                     subscription_type: "Customer",
                     zip_code: 19091
                    })
        Trip.create({duration: 98,
                     start_date: Date.strptime("1/6/2017", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 1000,
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
        expected = {"Subscriber" => {count: 2, pct: 66},
                    "Customer" => {count: 1, pct: 33}
                   }

        expect(Trip.subscription_types_and_info).to eq(expected)
      end
    end

    describe ".busiest_day" do
      it "returns the date of the busiest day" do
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "Union Station",
                     end_station_id: "3",
                     bike_id: 215,
                     subscription_type: "Customer",
                     zip_code: 19091
                    })
        Trip.create({duration: 98,
                     start_date: Date.strptime("1/6/2017", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 1000,
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

        expect(Trip.busiest_day).to eq(Date.strptime("8/6/2016", "%m/%d/%Y"))
      end
    end

    describe ".slowest_day" do
      it "returns the date of the slowest day" do
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "Union Station",
                     end_station_id: "3",
                     bike_id: 215,
                     subscription_type: "Customer",
                     zip_code: 19091
                    })
        Trip.create({duration: 98,
                     start_date: Date.strptime("1/6/2017", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "3",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        Trip.create({duration: 1000,
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

        expect(Trip.slowest_day).to eq(Date.strptime("1/6/2017", "%m/%d/%Y"))
      end
    end
    
  end
end
