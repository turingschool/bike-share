class BikeShareApp < Sinatra::Base
  get '/stations' do
    @stations = Station.all # What's AR's sorting method?

    erb :"stations/index"
  end

  get '/stations/new' do
    @stations = Station.new

    erb :"stations/new"
  end

  post '/stations' do
    city = City.create(name: params[:station][:city])
    params[:station].delete('city')
    city.stations.create(params[:station])

    redirect "/stations"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])

    erb :"stations/edit"
  end

  put '/stations/:id' do
    city = Station.find(params[:id]).city
    city = City.update(city.id, name: params[:station][:city])
    params[:station].delete('city')
    @station = Station.update(params[:id], params[:station])

    redirect "/stations/#{@station.id}"
  end

  delete '/stations/:id' do
    @station = Station.destroy(params[:id])

    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])

    erb :"stations/show"
  end

  get '/station-dashboard' do
    @station = Station

    erb :"stations/dashboard"
  end
#----------------------------------------------------------------
#----------------------------------------------------------------
#----Trips Controller medthods down below---------------------------
#----------------------------------------------------------------
  get '/trips' do
    if Trip.count < 31
      @trips = Trip.all
      erb :"trips/index"
    else
      redirect '/trips/page/1'
    end
  end

  get '/trips/new' do
      @bikes = [1,2]
      @weatherconditions = [1,2]
      @stations = Station.all

      erb :"trips/new"
  end

  post '/trips' do
    trip = params['trip']
    Trip.create(duration: trip['duration'].to_i,
                start_date: DateTime.parse(trip['start_date']),
                end_date: DateTime.parse(trip['end_date']), subscription_type: trip['subscription_type'],
                bike_id: 1, # Bike.find_by(bin: trip['bike'])
                start_station_id: 1,
                end_station_id: 2,
                weather_id: 1)

    redirect '/trips'
  end

  get '/trips/page/:page' do
    @page_number = params["page"].to_i
    batch_start = ((params["page"].to_i - 1) * 30) + 1
    @trips = Trip.find_each(:batch_size => 30, :start => batch_start, :finish => batch_start+29)

    erb :"trips/page"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])

    erb :"trips/show"
  end
end
