class BikeShareApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    erb :'stations/new'
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect :"stations/#{@station.id}"
  end

  get '/station-dashboard' do
    erb :'stations/dashboard'
  end
#weather conditions
  get '/conditions' do
    @conditions = Condition.all
    erb :'conditions/index'
  end

  get '/conditions/new' do
    erb :'conditions/new'
  end

  delete '/conditions/:id' do
    Condition.destroy(params[:id])
    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :'stations/edit'
  end

  put '/stations/:id' do
    @station = Station.update(params[:id])
    redirect :"stations/#{@station.id}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

end
