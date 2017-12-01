class BikeShareApp < Sinatra::Base
	set :method_override, true
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/stations' do
  	@stations = Station.all
  	erb :'stations/index'
	end

	get '/stations/new' do
		erb :'stations/new'
	end

	post '/stations' do
		# require 'pry'; binding.pry
		Station.create(params[:station])
		redirect '/stations'
	end

	get '/stations/:id' do
		@station = Station.find(params[:id])
		erb :'stations/show'
	end

	get '/stations/:id/edit' do
		@station = Station.find(params[:id])
		erb :'stations/edit'
	end


	put '/stations/:id' do |id|
		Station.update(id.to_i, params[:station])
		redirect "/stations/#{id}"
	end

	delete '/stations/:id' do |id|
		Station.destroy(id.to_i)
		redirect '/stations'
	end

  get '/station-dashboard' do
    @station = Station.all
    erb :'stations/station-dashboard'
  end

	get '/trips' do
		@trip = Trip.all
		erb :'trips/index'
	end

end
