class BikeShareApp < Sinatra::Base

  get '/conditions' do
    # @conditions = Condition.find_each(batch_size: 30) do |condition|
    # end
    @conditions = Condition.all#add functionality for chunking by 30 days
    erb :"conditions/index"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  post '/conditions' do
    @condition = Condition.create(params[:condition])
    redirect "/conditions/#{@condition.id}"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end
  #
  # get '/conditions/:id/edit' do
  #   @condition = Condition.find(params[:id])
  #   erb :"conditions/edit"
  # end
  #
  # put '/conditions/:id' do
  #   @condition = Condition.find(params[:id])
  #   redirect "conditions/#{@condition.id}"
  # end
  #
  # delete '/conditions/:id' do
  #   @condition = Condition.destroy(params[:id])
  #   redirect "conditions"
  # end

end
