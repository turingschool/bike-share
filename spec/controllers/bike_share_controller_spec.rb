RSpec.describe 'Bike Share Controller' do

  before do
    City.create(name: 'San Francisco')
    City.first.stations.create(name: 'chillest',   dock_count: 20, installation_date: "2017-08-06", lat: 100, lng: 200)
    City.first.stations.create(name: 'surf shack', dock_count: 10, installation_date: "2011-10-06", lat: 100, lng: 200)
    City.first.stations.create(name: 'burritos',   dock_count: 7,  installation_date: "2012-09-07", lat: 100, lng: 200)
    City.first.stations.create(name: 'whatever',   dock_count: 32, installation_date: "2015-08-06", lat: 100, lng: 200)
    City.first.stations.create(name: 'duplicate',  dock_count: 32, installation_date: "2015-08-06", lat: 100, lng: 200)
  end

  describe "GET '/station-dashboard" do

    it "loads dashboard" do
      get '/station-dashboard'
      expect(last_response).to be_ok
    end

    it "displays dashboard content" do
      get '/station-dashboard'
      expect(last_response.body).to include("chillest")
    end
  end
end