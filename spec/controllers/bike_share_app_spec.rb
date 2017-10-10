describe BikeShareApp do

  describe 'get routes' do
    describe "/" do
      it "loads without error" do
        get '/'

        expect(last_response).to be_ok
      end
    end

    describe "/stations" do
      it "loads without error" do
        get '/stations'

        expect(last_response).to be_ok
      end
    end

    describe "/stations/new" do
      it "loads without error" do
        get '/stations/new'

        expect(last_response).to be_ok
      end
    end

    describe "/stations/:id" do
      it "loads without error and brings in an instance variable with all stations" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        get '/stations/new'

        expect(last_response).to be_ok

      end
    end
  end

end
