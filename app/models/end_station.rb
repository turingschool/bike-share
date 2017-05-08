class EndStation < ActiveRecord::Base
  has_many :trips
  belongs_to :station

  validates :station_id, presence: true
end