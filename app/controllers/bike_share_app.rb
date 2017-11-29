class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"/dashboard"
  end

  get '/stations/index' do
    @stations = Station.all

    erb :"/stations/index"
  end
end
