class BikeShareApp < Sinatra::Base

  get '/stations' do
    erb :"stations/index"
  end

  get '/stations/view_all' do
    @stations = Station.all
    erb :"stations/view_all"
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :"stations/show"
  end

  set :method_override, true

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect "/stations"
  end

end
