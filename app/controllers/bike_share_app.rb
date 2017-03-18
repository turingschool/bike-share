class BikeShareApp < Sinatra::Base

  set :method_override, true 

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

end
