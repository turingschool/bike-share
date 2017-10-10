require 'will_paginate'
require 'will_paginate/active_record'

require_relative '../models/station.rb'
require_relative '../models/trip.rb'
require_relative '../models/condition.rb'
require_relative '../helpers/route'
require_relative '../helpers/rest_url'


class BikeShareApp < Sinatra::Base
  helpers RestUrl

  configure do
    register WillPaginate::Sinatra
  end
  set :root, File.expand_path("..", __dir__)
  set :protection, :except => :path_traversal
  enable :method_override


  def sub_erb(view)
    erb :"layouts/#{view}" do
      erb :"#{@model.name}/#{view}"
    end
  end

  def set_model(model)
    @model = self.class.const_get model.capitalize
  end

  def set_record(model, id)
    set_model(model)
    @id = id
    @record = @model.find(id)
  end


  before Route['\/trips', :new] do
    @stations = Station.all
  end

  before Route['\/trips', :id, :edit] do
    @stations = Station.all
  end


  get '/' do
    erb :home
  end

  get Route[:model, :dashboard] do |model|
    set_model(model)
    @records = @model.all
    sub_erb :dashboard
  end

  get Route[:model, :new] do |model|
    set_model(model)
    sub_erb :new
  end

  get Route[:model, :id, :edit] do |model, id|
    set_record(model, id)
    sub_erb :edit
  end

  get Route[:model, :id] do |model, id|
    set_record(model, id)
    sub_erb :show
  end

  get Route[:model] do |model|
    set_model(model)
    @records = @model.paginate(page: params[:page], per_page: 30)
    sub_erb :index
  end

  post Route[:model] do |model|
    set_model(model)
    @model.create(params[@model.name.downcase])
    redirect to "/#{@model.name.downcase}/#{@id}"
  end

  put Route[:model, :id] do |model, id|
    set_record(model, id)
    @record.update(params[@model.name.downcase])
    redirect to "/#{@model.name.downcase}/#{@id}"
  end

  delete Route[:model, :id] do |model, id|
    set_record(model, id)
    @record.destroy
    redirect to "/#{@model.name.downcase}"
  end

  def not_found
    status 404
    erb :not_found
  end

end
