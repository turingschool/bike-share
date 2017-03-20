require 'pry'
class BikeShareApp < Sinatra::Base

	get '/stations/new' do
		#inst var (AR methods)
		erb :new_station
	end

	get '/stations' do
		@stations = Station.all
    @cities = City.all
		erb :station_index
	end

	post '/stations' do
    city = City.create(params[:city]) #creates if it doesn't exist

    city = City.where(name: params[:city][:name]) #finds if it already exists

    # binding.pry

    params[:station][:city_id] = city.ids.first #Find out where .id method went to? Refactor to place in model
		Station.create(params[:station])


    if params["station"].any? {|_, v| (v.empty?) unless v.is_a?(Integer) || v.nil?}
      redirect '/stations/new'
    end

    if params["city"].any? {|_, v| (v.empty?) unless v.is_a?(Integer) || v.nil?}
      redirect '/stations/new'
    end

		redirect '/stations'
	end

  get '/stations/:id' do

    @station = Station.find(params[:id])
    @city_name = City.find(@station.city_id).name
    # binding.pry
    erb :"stations/show"
  end

  put '/stations/:id' do
    Station.update(params[:id], params[:station])
    redirect '/stations'
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

	get '/station-dashboard' do
		@station = Station
		erb :"stations/dashboard"
	end

  get '/trips' do
    @trips = Trip.all
    @station = Station
    erb :"trips/trip_index"
  end

  get '/trips/new' do
    @stations = Station.all
    # @trips = Trip
    erb :"trips/new"
  end

  post '/trips' do
    params[:trip][:duration] = (((DateTime.strptime(params[:trip][:end_date], "%Y-%m-%dT%l:%M")) - (DateTime.strptime(params[:trip][:start_date], "%Y-%m-%dT%l:%M"))) * 24 * 60 * 60).to_i
    Trip.create(params[:trip])

    redirect "/trips"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    @stations = Station.all
    # binding.pry
    erb :"trips/show"
  end

  # post '/trips' do


  # redirect '/trips'
  # end


end
