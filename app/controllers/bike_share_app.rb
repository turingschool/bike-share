class BikeShareApp < Sinatra::Base

  get '/stations' do
    erb :"stations/index"
  end

  get '/stations/view_all' do
    @stations = Station.all
    erb :"stations/view_all"
  end
  # 
  # get '/stations/:id' do
  #
  # end

end
