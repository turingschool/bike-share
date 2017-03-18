require 'pry'
class BikeShareApp < Sinatra::Base

	get '/stations/new' do
		#inst var (AR methods)
		erb :new_station
	end

	get '/stations' do
		@stations = Station.all
		erb :station_index
	end

	post '/stations' do
    # binding.pry
    city = City.create(params[:city])
    params[:station][:city_id] = city.id
		Station.create(params[:station])

    if params["station"].any? {|_, v| (v.empty?) unless v.is_a?(Integer) || v.nil?}
      redirect 'stations/new'
    end

    if params["city"].any? {|_, v| (v.empty?) unless v.is_a?(Integer) || v.nil?}
      redirect 'stations/new'
    end

		redirect '/stations'
	end
end
