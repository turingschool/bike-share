require 'pry'
class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/trips' do
    @trips = Trip.find_thirty_trips(1)
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

end
