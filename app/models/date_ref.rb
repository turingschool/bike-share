class DateRef < ActiveRecord::Base
  has_many :stations
  validates :date, presence: true
end
