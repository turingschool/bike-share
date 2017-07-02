class BikeShareApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/stations' do
    @stations = Station.all
    erb :"/stations/index"
  end

end
