require 'pry'
class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/trips' do
    @trips = Trip.all
    erb :trip_index
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
    Trip.update(params[:id], params[:trip])
    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect "/trips"
  end

end
