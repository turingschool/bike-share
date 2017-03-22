class Bike < ActiveRecord::Base
  has_many :trips

  validates :bike_number, presence: true, uniqueness: true
  
  def self.most_trips
    Bike.all.max_by {|bike| bike.trips.count}
  end
  
  def self.least_trips
    Bike.all.min_by {|bike| bike.trips.count}
  end
end
