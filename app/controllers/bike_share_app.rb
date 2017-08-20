class BikeShareApp < Sinatra::Base
  get '/' do
    erb :'home/index'
  end

  get '/stations' do
    @cities = City.all
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'stations/new'
  end

  post '/stations' do
    city = City.find(params[:station][:city_id])
    @station = Station.create(params[:station])
    city.stations << @station
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

  get '/cities' do
    @cities = City.all
    @stations = Station.all
    erb :'cities/index'
  end

  get '/cities/:id' do
    @city = City.find(params[:id])
    erb :'cities/show'
  end
end
