class TripsController < BikeShareApp
  set :views, File.join(APP_ROOT, "app", "views", "trips")

  get '/trips/new' do
    @trip = Trip.new
    erb :'new'
  end

  get '/trips/:id' do |id|
    @trip = Trip.find(id)
    erb :'show'
  end

  put '/trips/:id' do |id|
    trip_details = params[:trip]
    trip_details[:start_date] = Date.strptime(trip_details[:start_date],'%m/%d/%Y %H:%M')
    trip_details[:end_date] = Date.strptime(trip_details[:end_date],'%m/%d/%Y %H:%M')
    @trip = Trip.update(id, trip_details)
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id)
    redirect "/trips"
  end

  get 'trips/:id/edit' do |id|
    @trip = Trip.find(id)
    erb :"edit"
  end

  get '/trips' do
    @trips = Trip.all
    erb :"index"
  end

  post '/trips' do
    trip_details = params[:trip]
    trip_details[:start_date] = Date.strptime(trip_details[:start_date],'%m/%d/%Y %H:%M')
    trip_details[:end_date] = Date.strptime(trip_details[:end_date],'%m/%d/%Y %H:%M')
    @trip = Trip.create!(trip_details)
    redirect "/trips/#{@trip.id}"
  end

  get '/trips-dashboard' do
    @trips = Trip.all
    erb :"dashboard"
  end
end
