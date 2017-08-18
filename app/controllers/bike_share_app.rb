class BikeShareApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :'/station/index'
  end

  get '/stations/new' do
    erb :'station/new'
  end
end
