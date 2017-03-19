require 'pry'
class BikeShareApp < Sinatra::Base

	get '/stations/new' do
		#inst var (AR methods)
		erb :new_station
	end

	get '/stations' do
		@stations = Station.all
    @cities = City.all
		erb :station_index
	end

	post '/stations' do
    # binding.pry
    city = City.create(params[:city]) #creates if it doesn't exist

    city = City.where(name: params[:city][:name]) #finds if it already exists

    # binding.pry
    params[:station][:city_id] = city.ids.first # Refactor to place in model
		Station.create(params[:station]) 

    if params["station"].any? {|_, v| (v.empty?) unless v.is_a?(Integer) || v.nil?}
      redirect '/stations/new'
    end

    if params["city"].any? {|_, v| (v.empty?) unless v.is_a?(Integer) || v.nil?}
      redirect '/stations/new'
    end

		redirect '/stations'
	end

  get '/stations/:id' do

    @station = Station.find(params[:id])
    @city_name = City.find(@station.city_id).name
    # binding.pry
    erb :"stations/show"
  end

  put '/stations/:id' do
    Station.update(params[:id], params[:station])
    redirect '/stations'
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

end
