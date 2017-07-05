class Weather < ActiveRecord::Base
  validates_presence_of :date
  has_many :trips
end
