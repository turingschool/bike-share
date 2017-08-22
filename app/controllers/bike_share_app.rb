require 'pry'
require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base

  include WillPaginate::Sinatra::Helpers

  set :method_override, true

  helpers do
    def paginate(collection)
       options = {
         #renderer: BootstrapPagination::Sinatra,
         inner_window: 0,
         outer_window: 0,
         previous_label: '&laquo;',
         next_label: '&raquo;'
       }
      will_paginate collection, options
    end
  end

  get '/trips' do
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
    erb :'trips/trip_index'
  end

  post '/trips' do
    @trip = Trip.new(params)
    trip.save
    redirect'/trips'
  end

  get '/trips/new' do
    erb :trip_new
  end

  get '/trips/:id' do
    @trip = Trip.find(params["id"])
    erb :show_trip

  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params["id"])
    erb :trip_edit
  end

  put '/trips/:id/edit' do
    Trip.update(
    params[:id],
    duration: params[:duration],
    start_station: params[:start_station],
    end_station: params[:end_station],
    start_date: StartDate.find_or_create_by(date: params[:start_date]),
    end_date: EndDate.find_or_create_by(date: params[:end_date]),
    subscription_type: SubscriptionType.find_or_create_by(subscription_type:
    params[:subscription_type]),
    zip_code: ZipCode.find_or_create_by(zip_code: params[:zip_code])
    )

    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    Trip.reset_ids
    redirect "/trips"
  end

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

  get '/stations-dashboard' do
    @stations = Station.all
    erb :'stations/dashboard'
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
