class BikeShareApp < Sinatra::Base

  get '/trips' do
    @trips = Trip.all
    erb :trip_index
  end

  get '/trips/:id' do

  end

  get '/trips/new' do

  end

  get '/trips/:id/edit' do

  end

end
