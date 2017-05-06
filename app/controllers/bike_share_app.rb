class BikeShareApp < Sinatra::Base
  
#   get '/' do
#     erb :"home/index"
#   end

#station index landing page
  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

#form for new stations
  get '/stations/new' do  
    @city = City.all
    erb :"stations/new"
  end

#single station page
  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

#route after filling new station form
  post '/stations' do
    # binding.pry
    date = DateRef.create_date(params[:station][:installation_date])
    @station = Station.create(
      name: params[:station][:name],
      dock_count: params[:station][:dock_count],
      city_id: (params[:station][:city_id]),
      date_ref_id: date.id)
      binding.pry
    redirect "/stations/#{@station.id}"
  end

#form to edit station
  get '/stations/:id/edit' do
    @dates = DateRef.all
    @horse = Station.find(params[:id])
    erb :"stations/edit"
  end

#route to update after editing station
  put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "/stations/#{@station.id}"
  end

#route to delete single station
  delete '/stations/:id' do
    @station = Station.destroy(params[:id])
    redirect "/stations"
  end

end
