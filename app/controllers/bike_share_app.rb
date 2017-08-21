class BikeShareApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    @cities = City.all
    erb :'stations/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  post '/stations' do
    city_name = params["city"]
    city = City.find_or_create_by(city: city_name)
    station = Station.create(params["station"])
    redirect "/stations/#{station.id}"
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    @cities = City.all
    erb :"stations/edit"
  end

  put '/stations/:id' do |id|
    @station = Station.find(id)
    city_name = params["city"]
    city = City.find_or_create_by(city: city_name)
    @station.update(params["station"])
    @station.update(city_id: city.id)
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.delete(id)
    redirect '/stations'
  end

end
