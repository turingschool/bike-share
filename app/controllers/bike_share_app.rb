class BikeShareApp < Sinatra::Base

  get '/' do  
    erb :homepage
  end 

  get '/stations' do  
    @stations = Station.all 

    erb :"stations/index"
  end 

end
