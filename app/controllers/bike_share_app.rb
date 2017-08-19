class BikeShareApp < Sinatra::Base

  get '/trips' do
    @trips = Trip.all
    erb :trip_index
  end

  get '/trips/:id' do
    erb :trip_show

  end

  get '/trips/new' do
    erb :trip_new

  end

  get '/trips/:id/edit' do
    erb :trip_edit
  end

end
