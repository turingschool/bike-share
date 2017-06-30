class BikeShareApp < Sinatra::Base
  get "/" do
    erb :dashboard
  end

  get "/stations" do
    @stations = Station.all
    erb :"stations/index"
  end

  get "/stations/new" do
    erb :"stations/new"
  end

  post "/stations" do
    station = Station.new(params[:station])
    station.save
    redirect "/stations"
  end

  get "/stations/:id" do |id|
    Station.find(params[:id])
    redirect "/stations/#{id}"
  end

  get "/stations/:id/edit" do
    @station = Station.find(params[:id].to_i)
    erb :"stations/edit"
  end


end
