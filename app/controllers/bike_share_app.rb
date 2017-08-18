class BikeShareApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

end
