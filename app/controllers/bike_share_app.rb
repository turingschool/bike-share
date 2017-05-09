class BikeShareApp < Sinatra::Base

  get '/' do
    erb :index
  end

#station dashboard with statistics
  get '/stations-dashboard' do
    @dashboard_data = Station.dashboard
    erb :'stations/dashboard'
  end
  
#station index landing page
  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

#form for new stations
  get '/stations/new' do  
    @city = City.all
    erb :"stations/new"
  end

#single station page
  get '/stations/:id' do
    @station = Station.find(params[:id])
    @trip_individual_data = Station.individual_dashboard(params[:id].to_i)
    erb :"stations/show"
  end

#route after filling new station form
  post '/stations' do
    date = DateRef.find_or_create_by(date: params[:station][:installation_date])
    @station = Station.create(
                              name: params[:station][:name],
                              dock_count: params[:station][:dock_count],
                              city_id: (params[:station][:city_id]),
                              date_ref_id: date.id
                             )
    redirect "/stations/#{@station.id}"
  end

#form to edit station
  get '/stations/:id/edit' do
    @city = City.all
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

#route to update after editing station
  put '/stations/:id' do
    date = DateRef.find_or_create_by(date: params[:station][:installation_date])
    @station = Station.update(params[:id],
                              name: params[:station][:name],
                              dock_count: params[:station][:dock_count],
                              city_id: (params[:station][:city_id]),
                              date_ref_id: date.id
                             )

    redirect "/stations/#{@station.id}"
  end

#route to delete single station
  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect "/stations"
  end

  ###################################
  ##TRIPS
  ###################################

#trip dashboard with statistics
  get '/trips-dashboard' do
    @trips_dashboard_data = Trip.dashboard
    erb :'trips/dashboard'
  end


  get '/trips' do
    redirect 'trips/page/back/0'
  end
  
#trips index landing page
  get '/trips/page/back/0' do
    @page_index = 0
    @trips = Trip.page_load(0)
    erb :"/trips/index"
  end

  #trips index landing page
  get '/trips/page/:id' do
    @page_index = (params[:id].to_i + 1)
    @trips = Trip.limit(30).offset(@page_index * 30)
    erb :"/trips/index_b"
  end

  get '/trips/page/back/:id' do
    @page_index = (params[:id].to_i - 1)
    @trips = Trip.limit(30).offset(@page_index * 30)
    erb :"/trips/index_b"
  end

#form for new trips
  get '/trips/new' do  
    @stations = Station.all
    @subscriptions = SubscriptionType.all
    erb :"trips/new"
  end

#single trip page
  get '/trips/:id' do

    @trip = Trip.find(params[:id])
    erb :'trips/show'
  end

#route after filling new trip form
  post '/trips' do
    trip = Trip.create_new(params)
    redirect "/trips/#{trip.id}"
  end

#form to edit trips
  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    @stations = Station.all
    @subscriptions = SubscriptionType.all
    erb :'trips/edit'
  end

  put '/trips/:id' do
    trip = Trip.update_record(params)
    redirect "/trips/#{trip.id}"
  end

#route to delete single trip
  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect "/trips"
  end
end
