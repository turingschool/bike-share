class Zipcode < ActiveRecord::Base
  belongs_to :trip

  validates :zipcode, presence: true, uniqueness: true
end
