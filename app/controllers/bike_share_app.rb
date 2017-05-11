class BikeShareApp < Sinatra::Base
  get '/stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :"stations/show"
  end

  put '/stations/:id' do |id|
    station_details = params[:station]
    station_details[:installation_date] = Date.strptime(station_details[:installation_date],'%m/%d/%Y')
    @station = Station.update(id, station_details)
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id)
    redirect "/stations"
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    erb :"stations/edit"
  end

  get "/stations" do
    @page = (params[:page] || 1 ).to_i
    @stations = Station.paginate(@page)
    erb :"stations/index"
  end

  post '/stations' do
    station_details = params[:station]
    station_details[:installation_date] = Date.strptime(station_details[:installation_date],'%m/%d/%Y')
    @station = Station.create!(station_details)
    redirect "/stations/#{@station.id}"
  end

  get '/stations-dashboard' do
    @stations = Station.all
    erb :"stations/dashboard"
  end

  get '/trips/new' do
    @trip = Trip.new
    erb :'trips/new'
  end

  get '/trips/:id' do |id|
    @trip = Trip.find(id)
    erb :'trips/show'
  end

  put '/trips/:id' do |id|
    trip_details = params[:trip]
    trip_details[:start_date] = DateTime.strptime(trip_details[:start_date],'%m/%d/%Y %H:%M')
    trip_details[:end_date] = DateTime.strptime(trip_details[:end_date],'%m/%d/%Y %H:%M')
    @trip = Trip.update(id, trip_details)
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id)
    redirect "/trips"
  end

  get '/trips/:id/edit' do |id|
    @trip = Trip.find(id)
    erb :"trips/edit"
  end

  get "/trips" do
    @page = (params[:page] || 1 ).to_i
    @trips = Trip.paginate(@page)
    erb :"trips/index"
  end

  post '/trips' do
    trip_details = params[:trip]
    trip_details[:start_date] = DateTime.strptime(trip_details[:start_date],'%m/%d/%Y %H:%M')
    trip_details[:end_date] = DateTime.strptime(trip_details[:end_date],'%m/%d/%Y %H:%M')
    @trip = Trip.create!(trip_details)
    redirect "/trips/#{@trip.id}"
  end

  get '/trips-dashboard' do
    @trips = Trip.all
    erb :"trips/dashboard"
  end

  get '/conditions/new' do
    @condition = Condition.new
    erb :'conditions/new'
  end

  post '/conditions' do
    condition_details = params[:condition]
    condition_details[:date] = Date.strptime(condition_details[:date], '%m/%d/%Y')
    @condition = Condition.create!(condition_details)
    redirect "/conditions/#{@condition.id}"
  end

  get '/conditions/:id/edit' do |id|
    @condition = Condition.find(id)
    erb :"conditions/edit"
  end

  get '/conditions/:id' do |id|
    @condition = Condition.find(id)
    erb :"conditions/show"
  end

  put '/conditions/:id' do |id|
    condition_details = params[:condition]
    condition_details[:date] = Date.strptime(condition_details[:date],'%m/%d/%Y')
    @condition = Condition.update(id, condition_details)
    redirect "/conditions/#{id}"
  end

  delete '/conditions/:id' do |id|
    Condition.destroy(id)
    redirect "/conditions"
  end

  get "/conditions" do
    @page = (params[:page] || 1 ).to_i
    @conditions = Condition.paginate(@page)
    erb :"conditions/index"
  end

  get '/conditions-dashboard' do
    @conditions = Condition.all
    erb :"conditions/dashboard"
  end

  get '/' do
    erb :"/index"
  end
end
