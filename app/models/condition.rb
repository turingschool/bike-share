class Condition < ActiveRecord::Base
  has_many :trips

  # validates :condition, presence: true, uniqueness: true
end
