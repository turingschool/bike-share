class EndDate < ActiveRecord::Base
  belongs_to :ride_date
  has_many :trips
end
