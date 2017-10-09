require 'will_paginate'
require 'will_paginate/active_record'

require_relative '../models/station.rb'

class BikeShareApp < Sinatra::Base
  configure do
    register WillPaginate::Sinatra
  end
  set :root, File.expand_path("..", __dir__)
  set :method_override, true


  def sub_erb(view)
    erb @model.view do
      erb :"#{@model.view}/#{sublayout}"
    end
  end

  model = '\/(station|trip|condition)s?'
  dashboard = '-dashboard'
  create = '\/new'
  edit = '\/edit'
  id = '\/([1-9]\d+)'
  pattern = proc{ |*parts| '^' + Regexp.new parts.join }

  before pattern[model] do |model_match|
    @model = const_get model_match.capitalize
  end

  before pattern[model, id] do |model_match, id_match|
    @id = id.to_i
  end


  get '/' do
    erb :home
  end

  get pattern[model, dashboard] do
    sub_erb :dashboard
  end

  get pattern[model, create] do
    sub_erb :new
  end

  get pattern[model, id, edit] do
    @record = @model.find(@id)
    sub_erb :edit
  end

  get pattern[model, id] do
    @record = @model.find(@id)
    sub_erb :show
  end

  get pattern[model] do
    @records = @model.paginate(page: params[:page], per_page: 30)
    sub_erb :index
  end

  post pattern[model, id] do
    @model.create(@id, params[@model.view_name])
    redirect to "/#{@model.table_name}/#{@id}"
  end

  put pattern[model, id] do
    @model.update(@id, params[@model.view_name])
    redirect to "/#{@model.table_name}/#{@id}"
  end

  delete pattern[model, id] do
    @model.destroy(@id)
    redirect to "/#{@model.table_name}"
  end

  def not_found
    status 404
    erb :not_found
  end










  get '/stations' do
    @stations = Station.paginate(page: params[:page], per_page: 30)
    sub_erb :station, :index
  end

  get '/stations/new' do
    sub_erb :station, :new
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    sub_erb :station, :show
  end

  get '/station-dashboard' do
    @stations = Station.all
    sub_erb :station, :dashboard
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    sub_erb :station, :edit
  end

  post '/stations' do
    id = Station.create(params[:station]).id
    redirect "stations/#{id}"
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/station/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  get 'trip-dashboard' do
    sub_erb :trip, :dashboard
  end

  get '/trips' do
    @trips = Trip.paginate(page: params[:page], per_page: 30)
    sub_erb :trip, :index
  end

  get '/trips/new' do
    @stations = Station.all
    sub_erb :trip, :new
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    sub_erb :trip, :show
  end

  get '/trips/:id/edit' do
    @stations = Station.all
    @trip = Trip.find(params[:id])
    sub_erb :trip, :edit
  end

  post '/trips' do
    id = Trip.create(params[:trip])
    redirect "/trips/#{id}"
  end

  put '/trips/:id' do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trips/#{id}"
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect '/trips'
  end

  get '/conditions' do |id|
    @conditions = Conditions.paginate(page: params[:page], per_page: 30)
    sub_erb :condition, :index
  end

  not_found do
    status 404
    erb :not_found
  end
end
