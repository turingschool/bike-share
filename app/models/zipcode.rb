class Zipcode < ActiveRecord::Base
  has_many :trips
  has_many :conditions
  validates :zipcode, presence: true
end
