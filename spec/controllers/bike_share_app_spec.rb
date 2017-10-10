describe BikeShareApp do

  describe 'get routes' do
    describe "/" do
      it "loads without error" do
        get '/'
      end
    end

    describe "/stations" do
      it "loads without error" do
        get '/stations'
      end
    end

    describe "/stations/new" do
      it "loads without error" do
        get '/stations/new'
      end
    end

    describe "/stations/:id" do
      it "loads without error given the existence of a station with specified id in URI" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })

        get '/stations/1'
      end
    end

    describe "/stations/:id/edit" do
      it "loads without error given the existence of a station with specified id in URI" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })

        get '/stations/1/edit'
      end
    end
  end

  describe 'post methods' do
    describe "/stations" do
      it "redirects to '/stations/' without error" do
        post '/stations'

        expect(last_response).to be_redirect
        expect(last_response.header["Location"]).to eq("http://example.org/stations")
      end
    end
  end

  describe 'put methods' do
    describe "/stations/:id" do
      it "redirects to stations/:id without error if given correct params" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        put '/stations/1', params = {station: {name: "San Jose Diridon Caltrain Station",
                                               station_id: "10",
                                               dock_count: 1000,
                                               city: "San Jose",
                                               installation_date: "8/6/2013"}
                                    }

        expect(last_response).to be_redirect
        expect(last_response.header["Location"]).to eq("http://example.org/stations/1")
      end
    end
  end

end

# require 'pry'; binding.pry
