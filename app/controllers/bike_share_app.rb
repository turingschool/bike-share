class BikeShareApp < Sinatra::Base

  get '/' do
    erb :"/dashboard"
  end

  get '/stations/index' do
    @stations = Station.all

    erb :"/stations/index"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])

    erb :"/stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])

    erb :"/stations/edit"
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect '/stations/id'
  end

  # get '/station/:id/delete'
  # end
end
