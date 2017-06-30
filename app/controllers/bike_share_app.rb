class BikeShareApp < Sinatra::Base

  
  get '/stations/new' do
    erb :new
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end


end
