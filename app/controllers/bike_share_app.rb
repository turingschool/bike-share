class BikeShareApp < Sinatra::Base

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
    erb :trip_edit
  end

end
