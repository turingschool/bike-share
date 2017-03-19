class BikeShareApp < Sinatra::Base

  get "/stations" do
    @stations = Station.all
    erb :"stations/index"
  end

  get "/stations/new" do
    @station = Station.new
    @city = City.all
    erb :"stations/new"
  end

  post "/stations" do
    @station = Station.create(params[:station])
    redirect "/stations"
  end


  get "/stations/:id" do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

end
