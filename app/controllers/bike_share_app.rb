class BikeShareApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

#--------------trip------------------
  get '/trips' do
    @trips = Trip.all
    erb :"trips/index"
  end

  get '/trips/new' do
    @trip = Trip.new
    erb :"trips/new"
  end

  post '/trips' do
    @trip = Trip.create(params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id], params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  delete '/trips/:id' do
    @trip = Trip.destroy(params[:id])
    redirect "/trips"
  end
#--------------trip------------------

end
