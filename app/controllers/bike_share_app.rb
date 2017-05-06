class BikeShareApp < Sinatra::Base
  get '/stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)

    erb :"stations/show"
  end
end
