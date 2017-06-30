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
end
