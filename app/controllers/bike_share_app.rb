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
    @station = Station.create_station(params)
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
    Station.update_station(params)
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

  post '/trips' do
    # require "pry"; binding.pry
    start_station = params[:trip][:start_station]
    end_station = params[:trip][:end_station]
    subscription_type = params[:trip][:subscription_type]
    zip_code = ZipCode.find_or_create_by(zip_code: params[:trip][:zip_code]).id
    bike = Bike.find_by(bike_number: params[:trip][:bike_number]).id

    @trip = Trip.create(duration: params[:trip][:duration], start_date: params[:trip][:start_date], start_station_id: start_station, end_date: params[:trip][:end_date], end_station_id: end_station, subscription_type_id: subscription_type, zip_code_id: zip_code, bike_id: bike)

    redirect "/trips/#{@trip.id}"
  end

  get '/trips/new' do
    @stations = Station.all
    @subtypes = SubscriptionType.all
    erb :'trips/new'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'trips/show'
  end

  put '/trips/:id' do
    start_station = params[:trip][:start_station]
    end_station = params[:trip][:end_station]
    subscription_type = params[:trip][:subscription_type]
    zip_code = ZipCode.find_or_create_by(zip_code: params[:trip][:zip_code]).id
    bike = Bike.find_by(bike_number: params[:trip][:bike_number]).id


    input = {duration: params[:trip][:duration], start_date: params[:trip][:start_date], start_station_id: start_station, end_date: params[:trip][:end_date], end_station_id: end_station, subscription_type_id: subscription_type, zip_code_id: zip_code, bike_id: bike}
    Trip.find(params[:id]).update(input)

    redirect "/trips/#{params[:id]}"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    @stations = Station.all
    @subtypes = SubscriptionType.all

    erb :'trips/edit'
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])

    redirect '/trips'
  end

  get '/station-dashboard' do
    @stations = Station
    erb :"stations/dashboard"
  end
end
