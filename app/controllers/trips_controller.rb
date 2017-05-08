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
    trip_details[:start_date] = Date.strptime("08/30/2013 11:11",'%m/%d/%Y %H:%M')
  end



end
