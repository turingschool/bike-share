require_relative 'pagination'

class BikeShareApp < Sinatra::Base
  set :method_override, true

  include Pagination

  get "/" do
    redirect "/stations_dashboard"
  end

  get "/stations_dashboard" do
    @station = Station.all
    erb :"stations/stations_dashboard"
  end

  get "/stations" do
    @stations = Station.all
    erb :"stations/index"
  end

  get "/stations/new" do
    @station = Station.new
    @city = City.all
    erb :"stations/new"
  end

  post "/stations" do
    city_name = params[:station][:city]
    city = City.find_or_create_by(city: city_name)

    input = { name: params[:station][:name],
              dock_count: params[:station][:dock_count],
              city: city,
              installation_date: params[:station][:installation_date]
              }

    @station = city.stations.create(input)
    redirect "/stations"
  end

  get "/stations/:id/edit" do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put "/stations/:id" do
    city_name = params[:station][:city]
    city = City.find_or_create_by(city: city_name)

    input = { name: params[:station][:name],
              dock_count: params[:station][:dock_count],
              city: city,
              installation_date: params[:station][:installation_date]
              }

    @station = Station.update(params[:id], input)
    redirect "/stations/#{@station.id}"
  end

  get "/stations/:id" do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  delete "/stations/:id" do
    Station.destroy(params[:id])
    redirect "/stations"
  end

  get "/trips" do
    redirect "/trips/page/1"
  end

  get "/trips/new" do
    @trip = Trip.new

    erb :"trips/new"
  end

  post "/trips" do
    @trips = Trip.create_trip(params)
    redirect "/trips"
  end

  get "/trips/page/:num" do |page_num|
    trips     = Trip.where.not(start_date: nil)
    @trips    = on_page(trips, page_num.to_i)
    @next     = next_page(page_num.to_i, trips.count)
    @previous = previous_page(page_num.to_i)

    erb :"trips/index"
  end

  delete "/trips/:id" do
    Trip.destroy(params[:id])
    redirect "/trips"
  end
end


# any method we write below this we'll have access to from other methods
# can't test these
# not accessible outside this file
# declutters the routes
# move input down here for example
# city lookup too
