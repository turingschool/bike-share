get '/trips' do
  @trips = trip.all
  erb :"trips/index"
end

get '/trips/new' do
  erb :"trips/new"
end

get '/trip-dashboard' do
  #@count = trip.total_trip_count
  erb :"trips/trips-dashboard"
end

get '/trips/:id' do
  @trip = trip.find(params[:id])
  erb :"trips/show"
end

post '/trips/new' do
@trip = trip.new(params[:trip])
  if @trip.save
    redirect "/trips"
  else
    @params[:page] = :"/trips/new"
    erb :"/error"
  end
end

get '/trips/:id/edit' do
  @trip = trip.find(params[:id])
  erb :"trips/edit"
end

put '/trips/:id' do |id|
  if trip.update(id.to_i, params[:trip]) == false
    @params[:page] = :"/trips/new"
    erb :"/error"
  else
    trip.update(id.to_i, params[:trip])
    redirect "/trips/#{id}"
  end
end

delete '/trips/:id' do |id|
  trip.destroy(id.to_i)
  redirect '/trips'
end
