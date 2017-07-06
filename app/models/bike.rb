class Bike < ActiveRecord::Base
  validates :bike, presence: true

  def self.most_ridden_bike

  end

  def self.total_rides_for_most_ridden_bike

  end

  def self.least_ridden_bike

  end

  def self.total_rides_for_least_ridden_bike

  end


end
