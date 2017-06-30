class BikeShareApp < Sinatra::Base
  get "/" do
    erb :dashboard
  end

  get "/stations" do
    @stations = Station.all
    erb :"stations/index"
  end


end
