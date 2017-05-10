class Condition < ActiveRecord::Base

  def self.get_paginated_conditions(params)
    self.order(:date).paginate(:page => params[:page], :per_page => 30)
  end
end
