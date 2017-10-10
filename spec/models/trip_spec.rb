describe Trip do

  describe "Class Methods" do

    describe ".avg_duration" do
      it "returns the average duration of seconds in a time format" do
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

  end

end
