require_relative 'pagination'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base
  set :method_override, true


  # include Pagination
  include WillPaginate::Sinatra::Helpers

#====================STATION=======================

  get "/" do
    erb :"home"
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

#==========================TRIPS==========================

  get "/trips" do
    @trips = Trip.all.paginate(page: params[:page], per_page: 30)
    erb :"trips/index"
  end

  get "/trips_dashboard" do
    @trips = Trip.all
    erb :"trips/trips_dashboard"
  end

  get "/trips/new" do
    @trip = Trip.new
    erb :"trips/new"
  end

  get "/trips/:id" do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get "/trips/:id/edit" do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  post "/trips" do
    @trips = Trip.create_trip(params)
    redirect "/trips"
  end

  put "/trips/:id" do
    @trip = Trip.update_trip(params)
    redirect "/trips/#{@trip.first.id}"
  end


  delete "/trips/:id" do
    Trip.destroy(params[:id])
    redirect "/trips"
  end

  get "/conditions_dashboard" do
    @condition = Condition.all
    erb :"conditions/conditions_dashboard"
  end

  get "/conditions" do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get "/conditions/new" do
    erb :"conditions/new"
  end

  post "/conditions/:id" do
    @condition = Conditions.create(params[:condition])
    redirect "/conditions"
  end

  get "/conditions/:id/edit" do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

  put "/conditions/:id" do
    @condition = Condition.update(params[:id], params[:condition])
    redirect "/conditions/#{@condition.id}"
  end

  get "/conditions/:id" do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  delete "/conditions/:id" do
    Condition.destroy(params[:id])
    redirect "/conditions"
  end

end

# private

# def self.update_trip(params)
#   Trip.update(duration: params[:trip][:duration],
#     start_station: Station.find_or_create_by(name: params[:trip][:start_station]),
#     end_station: Station.find_or_create_by(name: params[:trip][:end_station]),
#     bike_id: params[:trip][:bike_id],
#     subscription: Subscription.find_or_create_by(subscription: params[:trip][:subscription]),
#     zipcode: Zipcode.find_or_create_by(zip_code: params[:trip][:zip_code]),
#     start_date: params[:trip][:start_date],
#     end_date: params[:trip][:end_date])
# end


# any method we write below this we'll have access to from other methods
# can't test these
# not accessible outside this file
# declutters the routes
# move input down here for example
# city lookup too
