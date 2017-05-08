class EndStation < ActiveRecord::Base
  has_many :trips
  belongs_to :station
end