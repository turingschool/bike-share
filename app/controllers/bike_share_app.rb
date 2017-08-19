class BikeShareApp < Sinatra::Base

  get '/station_dashboard' do
    @stations = Station.all
    erb :station_dashboard
  end

end
