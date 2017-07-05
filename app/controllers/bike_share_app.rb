class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  get '/' do
    erb :dashboard
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/station-dashboard' do
    #refactor
    @count = Station.total_station_count
    @average = Station.average_bikes_per_station
    @most_bikes = Station.most_bikes_available
    @stations_with_most_bikes = Station.stations_with_most_bikes
    @fewest_bikes_avaiable = Station.fewest_bikes_avaiable
    @stations_with_fewest_bikes = Station.stations_with_fewest_bikes
    @most_recent_station = Station.most_recent_station
    @oldest_station = Station.oldest_station
    erb :"stations/station-dashboard"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  post '/stations/new' do
    sf = StationForm.new(params[:station])
      if sf.save
        redirect '/stations'
      else
        @errors = sf.errors
        erb :"/stations/new"
      end
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    usf = UpdateStationForm.new(params)
    if usf.save
      redirect "/stations/#{params[:id]}"
    else
      @params[:page] = :"/stations/:id/edit"
    end
  end

  get '/error' do
    erb :"error"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  get '/trips' do
    @trips = Trip.all.order(:id).paginate(:page => params[:page], :per_page => 30)
    erb :"trips/index"
  end

  get '/trips/new' do
    @station_names = StationName.all.order(:name)
    erb :"trips/new"
  end

  get '/trip-dashboard' do
    erb :"trips/trips-dashboard"
  end

  get '/trips/:id' do
      @trip = Trip.find(params[:id])
      erb :"trips/show"
  end

  post '/trips/new' do
    tf = TripForm.new(params[:trip])
      if tf.save
        redirect "/trips"
      else
        @errors = tf.errors
        erb :"/stations/new"
      end
    end

  get '/trips/:id/edit' do
    @station_names = StationName.all.order(:name)
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  put '/trips/:id' do
    utf = UpdateTripForm.new(params)
    # if
      utf.save
      redirect "/trips/#{params[:id]}"
    # else
    #   @params[:page] = :"/trips/:id/edit"
    # end
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect '/trips'
  end

  get '/conditions' do
    @conditions = Weather.paginate(page: params[:page], per_page: 30)
    erb :"conditions/index"
  end

  get '/conditions/:id' do
    @condition = Weather.find(params[:id])
    erb :"conditions/show"
  end

  def execute_statement(sql)
     results = ActiveRecord::Base.connection.execute(sql)
     if results.present?
         return results
     else
         return nil
     end
  end
end
