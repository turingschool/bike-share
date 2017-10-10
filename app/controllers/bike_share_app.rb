require 'will_paginate'
require 'will_paginate/active_record'

require_relative '../models/station.rb'
require_relative '../models/trip.rb'
require_relative '../models/condition.rb'
require_relative '../util/route'
require_relative '../util/rest_url'


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


  before Route[:model] do |model_match|
    @model = self.class.const_get model_match.capitalize
  end

  before Route[:model, :id] do |model_match, id_match|
    @model = self.class.const_get model_match.capitalize
    @id = id_match.to_i
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

  get Route[:model, :dashboard] do |model_match|
    @model = self.class.const_get model_match.capitalize
    @records = @model.all
    sub_erb :dashboard
  end

  get Route[:model, :new] do
    sub_erb :new
  end

  get Route[:model, :id, :edit] do
    @record = @model.find(@id)
    sub_erb :edit
  end

  get Route[:model, :id] do
    @record = @model.find(@id)
    sub_erb :show
  end

  get Route[:model] do
    @records = @model.paginate(page: params[:page], per_page: 30)
    sub_erb :index
  end

  post Route[:model, :id] do
    @model.create(@id, params[@model.view_name])
    redirect to "/#{@model.name}/#{@id}"
  end

  put Route[:model, :id] do
    @model.update(@id, params[@model.view_name])
    redirect to "/#{@model.table_name}/#{@id}"
  end

  delete Route[:model, :id] do
    @model.destroy(@id)
    redirect to "/#{@model.table_name}"
  end

  def not_found
    status 404
    erb :not_found
  end

end
