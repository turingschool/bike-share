class BikeShareApp < Sinatra::Base
  set :method_override, true
  
  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :show
  end

  get '/stations/new' do
    erb :new
  end

  post '/stations' do
    Station.create(name: params[:station][:name],
                   dock_count: params[:station][:dock_count],
                   city: params[:station][:city],
                   installation_date: params[:station][:installation_date])
    redirect '/stations'
  end

  get '/stations/:id/edit' do
    @station = Station.find(:id)
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
