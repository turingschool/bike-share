class City < ActiveRecord::Base

  has_many :cities

  validates :name, presence: true

end
