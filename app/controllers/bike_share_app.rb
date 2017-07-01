class BikeShareApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/stations/new' do
    erb :new
  end

  get '/stations/all' do
    @stations = Station.all
    erb :index
  end

end
