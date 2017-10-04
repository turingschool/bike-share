class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/stations/new' do
    @cities = City.all
    erb :new
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :show
  end

  post '/stations' do
    params[:station][:installation_date] = DateTime.strptime((params[:station][:installation_date]), "%Y-%m-%d")

    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @cities  = City.all
    @station = Station.find(params[:id])
    erb :edit
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end
end
