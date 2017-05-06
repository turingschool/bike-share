class BikeShareApp < Sinatra::Base
  
  get '/' do
    erb :"home/index"
  end

#station index landing page
  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

#sinle station page
  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end


#form for new stations
  get '/stations/new' do
    erb :"stations/new"
  end

#route after filling new station form
  post '/stations' do
    @station = Station.create(params[:station])
    redirect "/stations/#{@station.id}"
  end

#form to edit station
  get '/stations/:id/edit' do
    @horse = Station.find(params[:id])
    erb :"stations/edit"
  end

#route to update after editing station
  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "/stations/#{@station.id}"
  end

#individual station page
  get '/statiions/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

#route to delete single station
  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect "/stations"
  end

end
