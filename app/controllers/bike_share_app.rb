class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"home/index"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  post '/stations' do
    city_name = params[:station][:city]
    city = City.find_or_create_by(name: city_name)
    input = {
      name: params[:station][:name],
      dock_count: params[:station][:dock_count],
      installation_date: params[:station][:installation_date]
    }
    @station = city.stations.create(input)
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do

    city_name = params[:station][:city]
    city = City.find_or_create_by(name: city_name)
    input = {
      name: params[:station][:name],
      dock_count: params[:station][:dock_count],
      city_id: city.id.to_s,
      installation_date: params[:station][:installation_date]
    }
    station = Station.find(params[:id]).update(input)

    redirect "/stations/#{params[:id]}"

  end

  delete '/stations/:id' do
    Station.destroy(params[:id])

    redirect '/stations'
  end

  get '/trips' do
    @trips = Trip.all
    erb :'trips/index'
  end

  get '/trips/new' do
    erb :'trips/new'
  end

  post '/trips' do
    require "pry"; binding.pry
    start_station = params[:trip][:start_station]
    Station.find_by(name: start_station)
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'trips/show'
  end

  get '/station-dashboard' do
    @stations = Station
    erb :"stations/dashboard"
  end

end
